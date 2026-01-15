class SearchModel {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? photo;
  final String? gender;
  // final String? specialization;
  // final String? degree;
  // final String? city;
  // final String? address;
  // final String? startTime;
  // final String? endTime;
  // final int? price;
  // final String? appointDuration;

  SearchModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    // this.specialization,
    // this.degree,
    // this.city,
    // this.address,
    // this.startTime,
    // this.endTime,
    // this.price,
    // this.appointDuration,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      photo: json['photo'],
      gender: json['gender'],
      // specialization: json['specialization']?['name'],
      // degree: json['degree'],
      // city: json['city']?['name'],
      // address: json['address'],
      // startTime: json['start_time'],
      // endTime: json['end_time'],
      // price: json['price'],
      // appointDuration: json['appoint_duration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'photo': photo,
      'gender': gender,
      // 'specialization': specialization,
      // 'degree': degree,
      // 'city': city,
      // 'address': address,
      // 'start_time': startTime,
      // 'end_time': endTime,
      // 'price': price,
      // 'appoint_duration': appointDuration,
    };
  }
}
