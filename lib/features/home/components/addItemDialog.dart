import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:lukytudoapp/core/colors.dart';
import 'package:lukytudoapp/features/home/homeController.dart';

class AddItemDialog extends StatelessWidget {
  const AddItemDialog({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 800,
            maxWidth: 800,
            minHeight: 400,
          ),
          child: Material(
            color: background02,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    "Add new item",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
                        decoration: BoxDecoration(
                            color: background,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: controller.textEditingController,
                          maxLines: 8,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Obx(() => Positioned(
                          right: 10,
                          bottom: 10,
                          child: FloatingActionButton.small(
                            tooltip:
                                "Record 10 Seconds of audio... \n You can record multiples audios.",
                            onPressed: () {
                              if (!controller.isLoading.value) {
                                controller.startRecognition();
                              } else {
                                ScaffoldMessenger.of(Get.context!).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        "Recording the audio, Please wait. "),
                                  ),
                                );
                              }
                            },
                            backgroundColor: Colors.pink.shade400,
                            child: controller.isLoading.value
                                ? const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : const HeroIcon(
                                    HeroIcons.microphone,
                                  ),
                          )))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() => Column(
                        children: controller.currentTodoItem.value.audioFiles
                            .map(
                              (file) => Row(
                                children: [
                                  TextButton.icon(
                                    onPressed: () => controller.playSound(file),
                                    icon: const HeroIcon(HeroIcons.musicalNote),
                                    label: Text(file.split('/')[1]),
                                    style: TextButton.styleFrom(
                                      alignment: Alignment.center,
                                      backgroundColor: Colors.blue.shade400,
                                      foregroundColor: Colors.white,
                                    ),
                                  ),
                                  IconButton(
                                      tooltip: "Remove this audio",
                                      onPressed: () => controller
                                          .removeAudioFromCurrentItem(file),
                                      color: Colors.red.shade400,
                                      icon: const HeroIcon(HeroIcons.trash))
                                ],
                              ),
                            )
                            .toList(),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 35,
                        width: 150,
                        child: TextButton(
                          onPressed: () {
                            if (!controller.isLoading.value) {
                              controller.cleanFields();
                            } else {
                              ScaffoldMessenger.of(Get.context!).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      "Recording the audio, Please wait. "),
                                ),
                              );
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              HeroIcon(HeroIcons.xCircle),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Cancel")
                            ],
                          ),
                          style: TextButton.styleFrom(
                            alignment: Alignment.center,
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      SizedBox(
                        height: 35,
                        width: 150,
                        child: TextButton(
                          onPressed: () {
                            if (!controller.isLoading.value) {
                              controller.addItem();
                            } else {
                              ScaffoldMessenger.of(Get.context!).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      "Recording the audio, Please wait. "),
                                ),
                              );
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const HeroIcon(HeroIcons.check),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Save")
                            ],
                          ),
                          style: TextButton.styleFrom(
                            alignment: Alignment.center,
                            backgroundColor: Colors.pink.shade400,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
