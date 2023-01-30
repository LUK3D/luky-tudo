import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:lukytudoapp/components/sidePannelButton.dart';
import 'package:lukytudoapp/core/colors.dart';
import 'package:lukytudoapp/features/home/components/sidePanel.dart';
import 'package:lukytudoapp/features/home/components/taskcard/taskCard.dart';
import 'package:lukytudoapp/features/home/homeController.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final currentWidth = Get.mediaQuery.size.width;
    final controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: background,
      body: Column(
        children: [
          Container(
            color: background02,
            height: 42,
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: HeroIcon(
                    HeroIcons.bars3,
                    color: textColor,
                  ),
                  splashRadius: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: HeroIcon(
                    HeroIcons.squares2x2,
                    color: Colors.white,
                    size: 20,
                    style: HeroIconStyle.solid,
                  ),
                  label: Text(
                    'Dashboard',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 1,
          ),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SidePanel(
                homeController: controller,
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                    child: Obx(() => ListView.builder(
                          itemCount: controller.todoList.value.length + 1,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Tasks-${controller.todoList.value.length}",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 35,
                                        child: TextButton(
                                          onPressed:
                                              (controller.showAddItemDialog),
                                          child: Row(
                                            children: [
                                              HeroIcon(HeroIcons.plusCircle),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("Add Item")
                                            ],
                                          ),
                                          style: TextButton.styleFrom(
                                            backgroundColor:
                                                Colors.pink.shade400,
                                            foregroundColor: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              );
                            }

                            var task = controller.todoList[index - 1];
                            return TaskCard(
                              todoItem: task,
                              homeController: controller,
                            );
                          },
                        )),
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
