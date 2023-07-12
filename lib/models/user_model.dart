// class UserModel{
//   String? name;
//   String? image;
//   String? email;
//   String? id;
//
//   UserModel({ this.name, this.email, this.image, this.id});
//
//   // refactoring map | json
//   UserModel.fromJson({required Map<String,dynamic> data}){
//     name = data['name'];
//     email = data['email'];
//     image = data['image'];
//     id = data['id'];
//   }
//
//   Map<String,dynamic> toJson(){
//     return {
//       'name' : name,
//       'email' : email,
//       'image' : image,
//       'id' : id,
//     };
//   }
// }