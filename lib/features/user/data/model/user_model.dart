class UserResponse {
  final String message;
  final List<UserModel> data;
  final bool status;
  final int code;

  UserResponse({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      message: json['message'],
      status: json['status'],
      code: json['code'],
      data: List<UserModel>.from(
        json['data'].map((e) => UserModel.fromJson(e)),
      ),
    );
  }
}

class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String gender;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
    );
  }
}
