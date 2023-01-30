import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:lukytudoapp/core/colors.dart';
import 'package:lukytudoapp/features/home/components/taskcard/taskcardController.dart';
import 'package:lukytudoapp/features/home/homeController.dart';
import 'package:lukytudoapp/models/todoItemModel.dart';

class TaskCard extends StatelessWidget {
  final TodoItemModel todoItem;
  final HomeController homeController;

  const TaskCard({
    Key? key,
    required this.todoItem,
    required this.homeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TaskCardController(todoItem, homeController),
        tag: todoItem.content);
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: todoItem.done ?? false,
            onChanged: (val) {
              todoItem.done = val;
              controller.homeController.updateItem(todoItem);
            },
            checkColor: Colors.white,
            fillColor: MaterialStatePropertyAll<Color>(
              Colors.pink.shade300,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Text(
                todoItem.content ?? '',
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    overflow: TextOverflow.fade),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const HeroIcon(
                        HeroIcons.calendar,
                        color: Colors.grey,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${todoItem.createdAt}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Visibility(
                    visible: todoItem.audioFiles.isNotEmpty,
                    child: TextButton.icon(
                        onPressed: () => controller.homeController
                            .playMultipleSounds(todoItem.audioFiles),
                        icon: const HeroIcon(HeroIcons.playCircle),
                        label: const Text("Play Audio")),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton.icon(
                    onPressed: () =>
                        controller.homeController.editItem(todoItem),
                    icon: const HeroIcon(HeroIcons.pencilSquare),
                    label: const Text("Edit"),
                    style: TextButton.styleFrom(foregroundColor: Colors.orange),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton.icon(
                    onPressed: () =>
                        controller.homeController.deleteItem(todoItem),
                    icon: const HeroIcon(HeroIcons.trash),
                    label: const Text("Delete"),
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.red.shade400),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: background02, borderRadius: BorderRadius.circular(10)),
    );
  }
}
