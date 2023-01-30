import 'package:get/get.dart';
import 'package:lukytudoapp/features/home/homeController.dart';
import 'package:lukytudoapp/models/todoItemModel.dart';

class TaskCardController extends GetxController {
  final TodoItemModel task;
  final HomeController homeController;

  TaskCardController(this.task, this.homeController);

  var isCHecked = false.obs;
}
