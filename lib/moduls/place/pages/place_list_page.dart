
import 'package:app_prueba/moduls/place/models/place_model.dart';
import 'package:app_prueba/moduls/place/models/place_page_controller.dart';
import 'package:app_prueba/moduls/place/pages/design_1_page.dart';
import 'package:app_prueba/moduls/place/pages/place_all_card_page.dart';
import 'package:app_prueba/moduls/place/widgets/card_float_detail_widget.dart';
import 'package:app_prueba/moduls/place/widgets/card_place_widget.dart';
import 'package:app_prueba/shared/preferences/place_preferences.dart';
import 'package:app_prueba/shared/widgets/bounce_animated_widget.dart';
import 'package:app_prueba/shared/widgets/rotate_animated_widget.dart';
import 'package:app_prueba/shared/widgets/scale_animated_widget.dart';
import 'package:app_prueba/shared/widgets/slide_direction_fade_animation_widget.dart';
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

  String initText = '';

  @override
  void initState() {
    controller.tabs.first.onTap.call();
    initAsync();
    super.initState();
  }

  void initAsync() async {
    initText = await PlacePreferences().getPlaceSearch();
    print('Guardado: $initText');
  }

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SlideDirectionFadeAnimationWidget(
                                curve: Curves.elasticInOut,
                                direction: SlideDirection.right,
                                child: Text(
                                  'Hola, David 👋',
                                  style: TextStyle(
                                    fontSize: mediaSize.width * 0.07,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SlideDirectionFadeAnimationWidget(
                                direction: SlideDirection.right,
                                delay: const Duration(milliseconds: 300),
                                child: Text(
                                  'Explore tho world',
                                  style: TextStyle(
                                    fontSize: mediaSize.width * 0.048,
                                    color: Colors.black87
                                  ),
                                ),
                              )
                            ]
                          ),
                        ),
                        ScaleAnimatedWidget(
                          curve: Curves.easeInOutCirc,
                          duration: const Duration(milliseconds: 700),
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(100.0),
                            child: Image.network(
                              'https://plus.unsplash.com/premium_photo-1690579805307-7ec030c75543?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29uJTIwaWNvbnxlbnwwfHwwfHx8MA%3D%3D',
                              width: mediaSize.width * 0.13,
                              height: mediaSize.width * 0.13,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    TextField(
                      //controller: TextEditingController(text: controller.textFilter),
                      controller: TextEditingController(text: initText),
                      onChanged: (textEdit) {
                        setState(() {
                          controller.textFilter = textEdit;
                          initText = textEdit;
                          PlacePreferences().setPlaceSearch(textEdit);
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
                          child: BounceAnimatedWidget(
                            duration: const Duration(milliseconds: 1000),
                            child: Text(
                              'Places',
                              style: TextStyle(
                                fontSize: mediaSize.width * 0.07,
                                fontWeight: FontWeight.bold
                              ),
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
                      children: controller.tabs.asMap().entries.map((element) => tabButtom(
                        index: element.key,
                        title: element.value.title,
                        isSelected: controller.codeTab == element.value.codeTab,
                        codeTab: element.value.codeTab,
                        onTap: element.value.onTap
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
            ],
          ),
        ),
      ),
    );
  }
  
  Widget tabButtom({
    required int index,
    required String title,
    required bool isSelected,
    required String codeTab,
    required Function() onTap,
  }) {
    return Expanded(
      child: ScaleAnimatedWidget(
        delay: Duration(milliseconds: index * 500),
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
      ),
    );
  }

  Widget cardPlace(PlaceModel placeModel) {
    return CardPlaceWidget(
      placeModel: placeModel,
      width: mediaSize.width * 1,
      height: mediaSize.width * 0.95,
    );
  }
}