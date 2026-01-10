/*
{
    "message": "Successful query",
    "data": [
        {
            "id": 6176,
            "name": "Salah",
            "email": "salahos@gmail.com",
            "phone": "222667845",
            "gender": "male"
        }
    ],
    "status": true,
    "code": 200
}
 */


class UserModel {
  final List<Data> data;


  UserModel({
    required this.data,
  });

  factory UserModel.fromjson(Map<String, dynamic> json) {
    return UserModel(
      data: (json['data'] as List).map((e) => Data.fromjson(e)).toList(),

    );
  }
}
class Data{
  final int id;
  final String name;
  final String email;
  final String phone;
  final String gender;
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
  });
  factory Data.fromjson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      gender: json['gender']?? '',
    );
  }
}
