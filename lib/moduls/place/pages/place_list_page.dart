
import 'package:app_prueba/moduls/place/models/place_model.dart';
import 'package:app_prueba/moduls/place/models/place_page_controller.dart';
import 'package:app_prueba/moduls/place/pages/design_1_page.dart';
import 'package:app_prueba/moduls/place/pages/place_all_card_page.dart';
import 'package:app_prueba/moduls/place/widgets/card_float_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlaceListPage extends StatefulWidget {
  const PlaceListPage({super.key});

  @override
  State<PlaceListPage> createState() => _PlaceListPageState();
}

class _PlaceListPageState extends State<PlaceListPage> {

  PlacePageController controller = PlacePageController();

  late Size mediaSize;

  @override
  void initState() {
    controller.tabs.first.onTap.call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hola, David 👋',
                            style: TextStyle(
                              fontSize: mediaSize.width * 0.07,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Explore tho world',
                            style: TextStyle(
                              fontSize: mediaSize.width * 0.048,
                              color: Colors.black87
                            ),
                          )
                        ]
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(100.0),
                      child: Image.network(
                        'https://plus.unsplash.com/premium_photo-1690579805307-7ec030c75543?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29uJTIwaWNvbnxlbnwwfHwwfHx8MA%3D%3D',
                        width: mediaSize.width * 0.13,
                        height: mediaSize.width * 0.13,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                TextField(
                  //controller: TextEditingController(text: controller.textFilter),
                  onChanged: (textEdit) {
                    setState(() {
                      controller.textFilter = textEdit;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(mediaSize.width * 0.05),
                    ),
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 20.0,
                          width: 2.0,
                          color: Colors.black87,
                        ),
                        SizedBox(width: 10.0,),
                        Icon(
                          Icons.settings_input_component,
                          color: Colors.black87,
                        )
                      ],
                    ),
                    hintText: 'Search places',
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Places',
                        style: TextStyle(
                          fontSize: mediaSize.width * 0.07,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceAllCardPage(),));
                      },
                      child: Text(
                        'View all',
                        style: TextStyle(
                          fontSize: mediaSize.width * 0.04,
                          color: Colors.black87
                        )
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: controller.tabs.map((element) => tabButtom(
                    title: element.title,
                    isSelected: controller.codeTab == element.codeTab,
                    codeTab: element.codeTab,
                    onTap: element.onTap
                  )).toList()
                ),
                SizedBox(height: 10.0,),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: controller.placeList.where(
                      (element) =>
                        element.title.toLowerCase().contains(controller.textFilter.toLowerCase()) ||
                        element.location.toLowerCase().contains(controller.textFilter.toLowerCase()) ||
                        element.ranking.toString().contains(controller.textFilter)
                    ).map((item) => cardPlace(item)).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget tabButtom({
    required String title,
    required bool isSelected,
    required String codeTab,
    required Function() onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            controller.codeTab = codeTab;
          });
          onTap.call();
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(
            horizontal: mediaSize.width * 0.015,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: mediaSize.width * 0.02,
            vertical: mediaSize.width * 0.02
          ),
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : const Color.fromARGB(255, 224, 224, 224),
            borderRadius: BorderRadius.circular(
              mediaSize.width * 0.04
            )
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: mediaSize.width * 0.04,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black54,
            ),
          ),
        ),
      ),
    );
  }

  Widget cardPlace(PlaceModel placeModel) {
    return GestureDetector(
      onTap: () {
        // push
        // push and replace
        // // route name - Widget
        // pop
        Navigator.push(context, MaterialPageRoute(builder:(context) => Design1Page(placeModel: placeModel,),));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: mediaSize.width * 0.02, vertical: mediaSize.width * 0.02),
        width: mediaSize.width * 0.6,
        height: mediaSize.width * 0.95,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 3.0,
              spreadRadius: 2.0,
              offset: const Offset(0, 3)
            )
          ]
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.network(
                placeModel.urlImg,
                width: mediaSize.width * 0.6,
                height: mediaSize.width * 0.95,
                fit: BoxFit.cover,
              ),
            ),
            CardFloatDetailWidget(
              widthWidgetParent: mediaSize.width * 0.6,
              model: placeModel,
              showPrice: false,
            ),
          ],
        ),
      ),
    );
  }
}