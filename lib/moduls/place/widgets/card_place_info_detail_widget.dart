import 'package:app_prueba/shared/widgets/fade_text_widget.dart';
import 'package:flutter/material.dart';

class CardPlaceInfoDetailWidget extends StatefulWidget {
  const CardPlaceInfoDetailWidget({super.key});

  @override
  State<CardPlaceInfoDetailWidget> createState() => _CardPlaceInfoDetailWidgetState();
}

class _CardPlaceInfoDetailWidgetState extends State<CardPlaceInfoDetailWidget> {
  late Size mediaSize;

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(mediaSize.width * 0.05),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Overview',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: mediaSize.width * 0.05,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: mediaSize.width * 0.05,),
                Text(
                  'Details',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: mediaSize.width * 0.04,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: mediaSize.width * 0.04,),
            Row(
              children: [
                iconDetailInfo(iconData: Icons.timer, text: '8 hours'),
                Expanded(child: Container()),
                iconDetailInfo(iconData: Icons.cloud, text: '16 C'),
                Expanded(child: Container()),
                iconDetailInfo(iconData: Icons.star, text: '4.5'),
              ],
            ),
            SizedBox(height: mediaSize.width * 0.04,),
            // Text(
            //   'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
            // ),
            Expanded(
              // height: mediaSize.height * 0.2,
              child: FadeTextWidget(
                text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                fontSize: mediaSize.width * 0.035,
              ),
            ),
            SizedBox(height: mediaSize.width * 0.04,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: mediaSize.width * 0.05),
              padding: EdgeInsets.all(mediaSize.width * 0.02),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(mediaSize.width * 0.03),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Book Now',
                    style: TextStyle(
                      fontSize: mediaSize.width * 0.04,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: mediaSize.width * 0.02,),
                  Icon(
                    Icons.open_in_browser,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget iconDetailInfo({
    required IconData iconData,
    required String text,
  }){
    return Row(
      children: [
        Container(
          width: mediaSize.width * 0.07,
          height: mediaSize.width * 0.07,
          padding: EdgeInsets.all(mediaSize.width * 0.01),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 216, 216, 216),
            borderRadius: BorderRadius.circular(mediaSize.width * 0.02),
          ),
          child: Icon(
            iconData,
            size: mediaSize.width * 0.04,
            color: Colors.black,
          ),
        ),
        SizedBox(width: mediaSize.width * 0.015,),
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: mediaSize.width * 0.035,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}