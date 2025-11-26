class TabItemModel {
  final String title;
  final String codeTab;
  final Function() onTap;

  TabItemModel({
    required this.title,
    required this.codeTab,
    required this.onTap,
  });
}