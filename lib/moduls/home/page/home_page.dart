import 'package:app_prueba/moduls/home/models/home_page_controller.dart';
import 'package:app_prueba/moduls/place/pages/place_list_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController controller = HomePageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        left: false,
        right: false,
        top: false,
        child: Column(
          children: [
            Expanded(
              child: controller.menu.firstWhere((element) => element.codePage == controller.initMenu).page,
            ),
            Row(
              children: controller.menu.map((item) => iconMenuBottom(
                iconData: item.iconData,
                iconDataSelected: item.iconDataSelected,
                codePage: item.codePage,
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget iconMenuBottom({
    required IconData iconData,
    required IconData iconDataSelected,
    required String codePage,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            controller.initMenu = codePage;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          child: Column(
            children: [
              Icon(
                controller.initMenu == codePage ? iconDataSelected : iconData,
                color: controller.initMenu == codePage ? Colors.black : Colors.black54,
                size: 30.0,
              ),
              Container(
                width: 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  color: controller.initMenu == codePage ? Colors.red : Colors.transparent,
                  borderRadius: BorderRadius.circular(100.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}