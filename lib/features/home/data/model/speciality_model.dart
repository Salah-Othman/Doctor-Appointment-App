class SpecialityModel {
  final List<SpecializationData> data;

  SpecialityModel({required this.data});

  factory SpecialityModel.fromJson(Map<String, dynamic> json) {
    return SpecialityModel(
      data: List<SpecializationData>.from(json['data'].map((e) => SpecializationData.fromJson(e))),
    );
  }
}

class SpecializationData {
  int? id;
  String? name;
  List<Doctors>? doctors;

  SpecializationData({this.id, this.name, this.doctors});

  SpecializationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['doctors'] != null) {
      doctors = <Doctors>[];
      json['doctors'].forEach((v) {
        doctors!.add(Doctors.fromJson(v));
      });
    }
  }
}

class Doctors {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? gender;
  String? address;
  String? description;
  String? degree;
  Specialization? specialization;
  City? city;
  int? appointPrice;
  String? startTime;
  String? endTime;

  Doctors(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.photo,
        this.gender,
        this.address,
        this.description,
        this.degree,
        this.specialization,
        this.city,
        this.appointPrice,
        this.startTime,
        this.endTime});

  Doctors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    photo = json['photo'];
    gender = json['gender'];
    address = json['address'];
    description = json['description'];
    degree = json['degree'];
    specialization = json['specialization'] != null
        ? Specialization.fromJson(json['specialization'])
        : null;
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    appointPrice = json['appoint_price'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }
}

class Specialization {
  int? id;
  String? name;

  Specialization({this.id, this.name});

  Specialization.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class City {
  int? id;
  String? name;
  Governrate? governrate;

  City({this.id, this.name, this.governrate});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    governrate = json['governrate'] != null
        ? Governrate.fromJson(json['governrate'])
        : null;
  }
}

class Governrate {
  int? id;
  String? name;

  Governrate({this.id, this.name});

  Governrate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
