class UserModel{

  dynamic name;
  dynamic phone;
  dynamic email;
  dynamic uId;
  dynamic image;
  UserModel(
      this.name,
      this.phone,
      this.email,
      this.uId,
      this.image,
      );


  UserModel.fromJson(Map<String, dynamic>? json){
    name = json?['name'];
    phone = json?['phone'];
    email = json?['email'];
    uId = json?['uId'];
    image = json?['image'];
  }

  Map<String, dynamic> toMap(){
    return{
      'name':name,
      'phone':phone,
      'email':email,
      'uId':uId,
      'image':image,
    };
}
}