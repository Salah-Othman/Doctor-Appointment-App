class SigninModel {
  final String name;

  final String? token;

  SigninModel({required this.name, this.token});

  factory SigninModel.fromJson(Map<String, dynamic> json) {
    print('🔍 Parsing user data - token field: ${json['token']}');
    return SigninModel(name: json['name'].toString(), token: json['token']);
  }
}
