class AppointmentResponse {
  String? message;
  List<AppointmentData>? data;
  bool? status;
  int? code;

  AppointmentResponse({this.message, this.data, this.status, this.code});

  factory AppointmentResponse.fromJson(Map<String, dynamic> json) {
    return AppointmentResponse(
      message: json['message'],
      data: json['data'] != null 
          ? (json['data'] as List).map((i) => AppointmentData.fromJson(i)).toList() 
          : null,
      status: json['status'],
      code: json['code'],
    );
  }
}

class AppointmentData {
  int? id;
  Doctor? doctor;
  Patient? patient;
  String? appointmentTime;
  String? appointmentEndTime;
  String? status;
  String? notes;
  int? appointmentPrice;

  AppointmentData({
    this.id,
    this.doctor,
    this.patient,
    this.appointmentTime,
    this.appointmentEndTime,
    this.status,
    this.notes,
    this.appointmentPrice,
  });

  factory AppointmentData.fromJson(Map<String, dynamic> json) {
    return AppointmentData(
      id: json['id'],
      doctor: json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null,
      patient: json['patient'] != null ? Patient.fromJson(json['patient']) : null,
      appointmentTime: json['appointment_time'],
      appointmentEndTime: json['appointment_end_time'],
      status: json['status'],
      notes: json['notes'],
      appointmentPrice: json['appointment_price'],
    );
  }
}

class Doctor {
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

  Doctor({
    this.id,
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
    this.endTime,
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
      specialization: json['specialization'] != null 
          ? Specialization.fromJson(json['specialization']) 
          : null,
      city: json['city'] != null ? City.fromJson(json['city']) : null,
      appointPrice: json['appoint_price'],
      startTime: json['start_time'],
      endTime: json['end_time'],
    );
  }
}

class Specialization {
  int? id;
  String? name;

  Specialization({this.id, this.name});

  factory Specialization.fromJson(Map<String, dynamic> json) {
    return Specialization(id: json['id'], name: json['name']);
  }
}

class City {
  int? id;
  String? name;
  Governrate? governrate;

  City({this.id, this.name, this.governrate});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      governrate: json['governrate'] != null 
          ? Governrate.fromJson(json['governrate']) 
          : null,
    );
  }
}

class Governrate {
  int? id;
  String? name;

  Governrate({this.id, this.name});

  factory Governrate.fromJson(Map<String, dynamic> json) {
    return Governrate(id: json['id'], name: json['name']);
  }
}

class Patient {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? gender;

  Patient({this.id, this.name, this.email, this.phone, this.gender});

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
    );
  }
}