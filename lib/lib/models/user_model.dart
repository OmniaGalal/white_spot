class UserModel{
  String? name;
  String? email;
  String? id;

  UserModel({required this.name,required this.email,required this.id});

  // refactoring map | json
  UserModel.fromJson({required Map<String,dynamic> data}){
    name = data['name'];
    email = data['email'];
    id = data['id'];
  }

  Map<String,dynamic> toJson(){
    return {
      'name' : name,
      'email' : email,
      'id' : id,
    };
  }
}