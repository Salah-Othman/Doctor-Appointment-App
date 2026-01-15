class SigninModel {
  final String name;

  final String? token;

  SigninModel({required this.name, this.token});

  factory SigninModel.fromJson(Map<String, dynamic> json) {
    print('🔍 Parsing user data - token field: ${json['token']}');
    print('🔍 Parsing user data - name field: ${json['username']}');

    return SigninModel(name: json['username'].toString(), token: json['token']);
  }
}
