// class SignupBody{
//   String ? name;
//   String ? phone;
//   String ? email;
//   String ? password;
//   SignupBody({
//      this.name,
//      this.phone,
//     this.email,
//     this.password
// });
  class SignupBody{
  String  name;
  String  phone;
  String  email;
  String  password;
  SignupBody({
    required  this.name,
    required    this.phone,
    required this.email,
    required this.password
  });
  // SignupBodyModel.fromJson(Map<String, dynamic> json)=>SignupBody (
  //   phone : json['phone'],
  //   name : json['name'],
  //   email : json['email'],
  //   password : json['password'],
  //
  // );
  // SignupBody.fromJson(Map<String, dynamic> json) {
  //   phone = json['phone'];
  //   name = json['f_name'];
  //   email = json['email'];
  //   password = json['password'];
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'phone': this.phone,
  //     'f_name': this.name,
  //     'email': this.email,
  //     'password': this.password,
  //   };
  // }
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data= new Map<String,dynamic>();
    data["f_name"] = this.name;
    data["phone"]=this.phone;
    data["email"]=this.email;
    data["password"]=this.password;
    return data;
  }
}