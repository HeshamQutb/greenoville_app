class ArticlesModel {
  final String title;
  final String description;
  final String image;
  final String url;

  ArticlesModel({
    required this.title,
    required this.description,
    required this.image,
    required this.url,
  });

  factory ArticlesModel.fromJson(json){
    return ArticlesModel(
      title: json['title'],
      description: json['description'],
      image: json['image'],
      url: json['url'],
    );
  }

}
