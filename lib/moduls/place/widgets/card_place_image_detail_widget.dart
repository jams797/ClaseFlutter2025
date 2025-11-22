import 'package:flutter/material.dart';

class CardPlaceImageDetailWidget extends StatefulWidget {
  const CardPlaceImageDetailWidget({super.key});

  @override
  State<CardPlaceImageDetailWidget> createState() => _CardPlaceImageDetailWidgetState();
}

class _CardPlaceImageDetailWidgetState extends State<CardPlaceImageDetailWidget> {
  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      // width: mediaSize.height * 0.45,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0,
                  spreadRadius: 3.0,
                  offset: const Offset(0, 10)
                )
              ]
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                'https://images.unsplash.com/photo-1530273883449-aae8b023c196?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Ymx1ZSUyMG1vdW50YWlufGVufDB8fDB8fHww',
                height: mediaSize.height * 0.45,
                fit: BoxFit.cover,
              ),
            ),
          ),
          iconFloatImage(
            left: 30.0,
            iconData: Icons.arrow_back_ios,
            onPress: () => Navigator.pop(context),
          ),
          iconFloatImage(
            right: 30.0,
            iconData: Icons.bookmark_border_outlined,
            onPress: () { print('bookmark'); },
          ),
          Positioned(
            bottom: mediaSize.height * 0.015,
            child: Container(
              width: mediaSize.width * 0.82,
              margin: EdgeInsets.all(mediaSize.width * 0.05),
              padding: EdgeInsets.all(mediaSize.width * 0.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color.fromARGB(255, 0, 24, 44),
                    const Color.fromARGB(255, 0, 52, 94),
                  ]
                )
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Andes Mountain',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: mediaSize.width * 0.062,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: const Color.fromARGB(255, 153, 153, 153),
                            ),
                            Text(
                              'South, America',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 153, 153, 153),
                                fontSize: mediaSize.width * 0.041,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                          color: Color.fromARGB(255, 153, 153, 153),
                          fontSize: mediaSize.width * 0.036,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '\$',
                          style: TextStyle(
                            color: Color.fromARGB(255, 100, 100, 100),
                            fontSize: mediaSize.width * 0.036,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: '230',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 209, 209, 209),
                                fontSize: mediaSize.width * 0.06,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget iconFloatImage({
    double? left,
    double? right,
    required IconData iconData,
    Function()? onPress,
  }) {
    Size mediaSize = MediaQuery.of(context).size;
    return Positioned(
      top: 30.0,
      left: left,
      right: right,
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          width: mediaSize.width * 0.08,
          height: mediaSize.width * 0.08,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(166, 0, 0, 0),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(
            iconData,
            color: Colors.white,
            size: mediaSize.width * 0.035,
          ),
        ),
      ),
    );
  }
}