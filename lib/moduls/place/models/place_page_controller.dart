import 'package:app_prueba/moduls/place/models/place_model.dart';
import 'package:app_prueba/moduls/place/models/tab_item_model.dart';

class PlacePageController {

  
  String codeTab = 'popular';

  String textFilter = '';

  late List<TabItemModel> tabs;

  List<PlaceModel> placeList = [];

  PlacePageController() {
    setPlaces();
    setPlaces();
    setPlaces();
    
    tabs = [
      TabItemModel(
        title: 'Popular',
        codeTab: 'popular',
        onTap: () {
          placeList.sort((e1, e2) {
            return e2.ranking.compareTo(e1.ranking);
          });
        }
      ),
      TabItemModel(
        title: 'Price',
        codeTab: 'price',
        onTap: () {
          placeList.sort((e1, e2) {
            return e2.price.compareTo(e1.price);
          });
        }
      ),
      TabItemModel(
        title: 'Top',
        codeTab: 'top',
        onTap: () {
          placeList.sort((e1, e2) {
            return e2.date.compareTo(e1.date);
          });
        }
      ),
    ];
  }

  void setPlaces() {
    placeList.add(PlaceModel(
      urlImg: 'https://images.unsplash.com/photo-1530273883449-aae8b023c196?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Ymx1ZSUyMG1vdW50YWlufGVufDB8fDB8fHww',
      title: 'Andes Mountain',
      location: 'South, America',
      price: 230,
      hours: 8,
      grade: 16,
      ranking: 4.5,
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      urlButtom: 'https://pub.dev/packages/url_launcher',
      date: DateTime(2025, 10, 10),
    ));
    placeList.add(PlaceModel(
      urlImg: 'https://res.cloudinary.com/worldpackers/image/upload/c_limit,f_auto,q_auto,w_1140/p6oghqt3kgdpjgvqmkww',
      title: 'Ruinas',
      location: 'Mexico',
      price: 300,
      hours: 12,
      grade: 45,
      ranking: 4.8,
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      urlButtom: 'https://www.google.com',
      date: DateTime(2025, 11, 10),
    ));
    placeList.add(PlaceModel(
      urlImg: 'https://ichef.bbci.co.uk/ace/ws/640/cpsprodpb/5815/live/467d1850-e2eb-11ef-a83b-bf768968ed36.jpg.webp',
      title: 'FFFF',
      location: 'DDDD',
      price: 400,
      hours: 12,
      grade: 45,
      ranking: 3.8,
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      urlButtom: 'https://www.google.com',
      date: DateTime(2025, 1, 10),
    ));
    placeList.add(PlaceModel(
      urlImg: 'https://www.avis.co.in/blog/wp-content/uploads/2018/08/paris-600x375.jpg',
      title: 'Francia',
      location: 'Paris',
      price: 300,
      hours: 12,
      grade: 45,
      ranking: 4.9,
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      urlButtom: 'https://www.google.com',
      date: DateTime(2025, 5, 11),
    ));
    placeList.add(PlaceModel(
      urlImg: 'https://www.avis.co.in/blog/wp-content/uploads/2018/08/paris-600x375.jpg',
      title: 'Francia',
      location: 'Paris',
      price: 300,
      hours: 12,
      grade: 45,
      ranking: 4.9,
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      urlButtom: 'https://www.google.com',
      date: DateTime(2025, 5, 11),
    ));
  }
}