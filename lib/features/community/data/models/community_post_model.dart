class CommunityPostModel {
  dynamic name;
  dynamic uId;
  dynamic image;
  dynamic postImage;
  dynamic dateTime;
  dynamic clockTime;
  dynamic description;
  List<dynamic>? likes;
  dynamic postId;

  CommunityPostModel({
    this.name,
    this.uId,
    this.image,
    this.postImage,
    this.dateTime,
    this.clockTime,
    this.description,
    this.likes,
    this.postId,
  });

  CommunityPostModel.fromJson(Map<String, dynamic>? json) {
    name = json?['name'];
    uId = json?['uId'];
    image = json?['image'];
    postImage = json?['postImage'];
    dateTime = json?['dateTime'];
    clockTime = json?['clockTime'];
    description = json?['text'];
    likes = json?['likes'];
    postId = json?['postId'];
  }

  int getLikesCount() {
    return likes?.length ?? 0;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'image': image,
      'postImage': postImage,
      'dateTime': dateTime,
      'clockTime': clockTime,
      'text': description,
      'likes': likes,
      'postId': postId,
    };
  }
}
