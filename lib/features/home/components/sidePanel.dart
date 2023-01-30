import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:lukytudoapp/components/sidePannelButton.dart';
import 'package:lukytudoapp/core/colors.dart';
import 'package:lukytudoapp/features/home/homeController.dart';

class SidePanel extends StatelessWidget {
  final HomeController homeController;

  const SidePanel({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: 250,
        color: background02,
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SidePanelButton(
                onPressed: () => homeController.filterItems(''),
                label: "All Tasks",
                icon: HeroIcon(
                  HeroIcons.queueList,
                  color: Colors.white,
                  style: HeroIconStyle.solid,
                ),
                iconColor: Colors.blue.shade300,
                splashColor: Colors.blue,
              ),
              SizedBox(
                height: 10,
              ),
              SidePanelButton(
                onPressed: () => homeController.filterItems('done'),
                label: "Done",
                icon: HeroIcon(
                  HeroIcons.checkBadge,
                  color: Colors.white,
                  style: HeroIconStyle.solid,
                ),
                iconColor: Colors.orange.shade300,
                splashColor: Colors.orange,
              ),
              SizedBox(
                height: 10,
              ),
              SidePanelButton(
                onPressed: () => homeController.filterItems('not done'),
                label: "To do",
                icon: HeroIcon(
                  HeroIcons.listBullet,
                  color: Colors.white,
                  style: HeroIconStyle.solid,
                ),
                iconColor: Colors.pink.shade300,
                splashColor: Colors.pink,
              ),
            ],
          ),
        ));
  }
}
