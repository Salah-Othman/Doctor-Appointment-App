class HomeModel {
  final List<Data> data;

  HomeModel({required this.data});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      data: List<Data>.from(json['data'].map((e) => Data.fromJson(e))),
    );
  }
}

class Data {
  final int id;
  final String name;
  final List<Doctor> doctors;

  Data({required this.id, required this.name, required this.doctors});
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      name: json['name'],
      doctors: List<Doctor>.from(
        json['doctors'].map((e) => Doctor.fromJson(e)),
      ),
    );
  }
}

class Doctor {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String photo;
  final String gender;
  final String address;
  final String description;
  final String degree;
  final num appointPrice;
  final String startTime;
  final String endTime;

  Doctor({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photo,
    required this.gender,
    required this.address,
    required this.description,
    required this.degree,
    required this.appointPrice,
    required this.startTime,
    required this.endTime,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      photo: json['photo'],
      gender: json['gender'],
      address: json['address'],
      description: json['description'],
      degree: json['degree'],
      appointPrice: json['appoint_price'],
      startTime: json['start_time'],
      endTime: json['end_time'],
    );
  }
}
