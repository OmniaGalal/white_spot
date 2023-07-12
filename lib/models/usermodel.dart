class UserModel{
  String? uid;
  String? Name;
  String? mail;
  UserModel({this.Name,this.mail,this.uid});

  //data from server
  factory UserModel.fromJson(jsonData){
    return UserModel(mail: jsonData["mail"],Name:  jsonData['Name'],
    );
  }
  // factory UserModel.fromJson(jsonData){
  //   return UserModel(mail: jsonData ["mail"] ,Name: jsonData["id"]);
  // }

  //data to server
Map<String,dynamic> toMap(){
    return {
      'Name':Name,
      'mail':mail,
    };
}
}
