class PlaceModel {
  String urlImg;
  String title;
  String location;
  String description;
  double price;
  double hours;
  double grade;
  double ranking;
  String urlButtom;
  DateTime date;

  PlaceModel({
    required this.urlImg,
    required this.title,
    required this.location,
    required this.description,
    required this.price,
    required this.hours,
    required this.grade,
    required this.ranking,
    required this.urlButtom,
    required this.date
  });
}