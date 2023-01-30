import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lukytudoapp/core/utils.dart';
import 'package:lukytudoapp/features/home/components/addItemDialog.dart';
import 'package:lukytudoapp/models/todoItemModel.dart';
import 'package:process_run/shell.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  final player = AudioPlayer();

  var isLoading = false.obs;
  TextEditingController textEditingController = TextEditingController();
  var speechRecognitionApp = '';
  var currentTodoItem = TodoItemModel(audioFiles: []).obs;
  var todoList = <TodoItemModel>[].obs;
  var unfilteredTodoList = <TodoItemModel>[];
  var searching = ''.obs;

  late File configFile;

  void filterItems(String word) {
    if (word.isEmpty) {
      todoList.value = unfilteredTodoList;
      return;
    }
    if (word == 'done') {
      todoList.value =
          unfilteredTodoList.where((element) => element.done == true).toList();
      return;
    }
    todoList.value = unfilteredTodoList
        .where((element) => element.done == false || element.done == null)
        .toList();
  }

  Future startRecognition() async {
    isLoading.value = true;
    var result = await Shell()
        .run(''' "$speechRecognitionApp"''', onProcess: ((process) {}));

    var resultText = result.outText;

    if (resultText.split('True}').length > 1) {
      var data = resultText.split('True}')[1].split('FILENAME:');
      textEditingController.text = "${textEditingController.text} ${data[0]}";
      currentTodoItem.value.audioFiles.add(data[1]);
      currentTodoItem.value = TodoItemModel.fromJson(currentTodoItem.toJson());
    } else {
      print("There was an error...");
    }
    isLoading.value = false;
  }

  void removeAudioFromCurrentItem(String path) async {
    currentTodoItem.value.audioFiles.remove(path);
    currentTodoItem.value = TodoItemModel.fromJson(currentTodoItem.toJson());
    try {
      final f = File(path);
      if (await f.exists()) {
        f.delete();
      }
    } catch (e) {
      print(e);
    }
  }

  Future playSound(String file) async {
    await player.play(DeviceFileSource(file));
  }

  Future playMultipleSounds(List<String> files) async {
    await player.play(DeviceFileSource(files[0]));
    player.onPlayerComplete.listen((event) {
      var tmpFiles = files;
      if (tmpFiles.length > 1) {
        tmpFiles.removeAt(0);
        playMultipleSounds(tmpFiles);
      }
    });
  }

  void addItem() {
    currentTodoItem.value.content = textEditingController.text;

    if (currentTodoItem.value.createdAt != null) {
      updateItem(currentTodoItem.value);
    } else {
      currentTodoItem.value.createdAt =
          DateTime.now().toIso8601String().split('.')[0];
      todoList.insert(0, currentTodoItem.value);
    }

    cleanFields();
  }

  void cleanFields() {
    unfilteredTodoList = todoList.value;
    box.write('tasks', unfilteredTodoList.map((e) => e.toJson()).toList());

    //Cleaning up the fields....
    textEditingController.clear();
    currentTodoItem.value = TodoItemModel(audioFiles: []);
    Get.back();
  }

  void updateItem(TodoItemModel item) {
    todoList.value = todoList.map((element) {
      if (element.createdAt == item.createdAt) {
        return item;
      } else {
        return element;
      }
    }).toList();

    //Creaning up the fields....
    cleanFields();
  }

  void editItem(TodoItemModel item) {
    currentTodoItem.value = item;
    textEditingController.text = item.content ?? '';
    showAddItemDialog();
  }

  void deleteItem(TodoItemModel item) {
    todoList.remove(item);
    item.audioFiles.forEach(
      (path) async {
        final f = File(path);
        if (await f.exists()) {
          f.delete();
        }
      },
    );

    unfilteredTodoList = todoList.value;
    box.write('tasks', unfilteredTodoList.map((e) => e.toJson()).toList());
  }

  void showAddItemDialog() {
    Get.dialog(AddItemDialog(controller: this));
  }

  @override
  void onInit() async {
    super.onInit();
    configFile = File('./config.txt');
    speechRecognitionApp = await Utils().readFile(configFile: configFile);
    var data = box.read('tasks');
    if (data != null) {
      unfilteredTodoList = List<TodoItemModel>.from(
          data.map((element) => TodoItemModel.fromJson(element)).toList());
    }

    todoList.value = unfilteredTodoList;
  }
}
