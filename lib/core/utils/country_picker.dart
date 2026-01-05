import 'dart:convert';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

void pickCountryCode({
  required BuildContext context,
  required void Function(PickCountryPicker) onSelect,
}) => showCountryPicker(
  context: context,
  showPhoneCode: true, // optional. Shows phone code before the country name.
  onSelect: (Country){
    onSelect(
      PickCountryPicker(
        phoneCode: '+${Country.phoneCode}',
        flagEmoji: Country.flagEmoji,
      ),
    );
  },
);

class PickCountryPicker {
  final String phoneCode;
  final String flagEmoji;

  PickCountryPicker({required this.phoneCode, required this.flagEmoji});

  PickCountryPicker copyWith({String? phoneCode, String? flagEmoji}) {
    return PickCountryPicker(
      phoneCode: phoneCode ?? this.phoneCode,
      flagEmoji: flagEmoji ?? this.flagEmoji,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'phoneCode': phoneCode, 'flagEmoji': flagEmoji};
  }

  factory PickCountryPicker.fromMap(Map<String, dynamic> map) {
    return PickCountryPicker(
      phoneCode: map['phoneCode'] as String,
      flagEmoji: map['flagEmoji'] as String,
    );
  }
  String toJson() => json.encode(toMap());
  factory PickCountryPicker.fromJson(String source) =>
      PickCountryPicker.fromMap(json.decode(source) as Map<String, dynamic>);
  @override
  String toString() =>
      'PickCountryPicker(phoneCode: $phoneCode, flagEmoji: $flagEmoji)';
  @override
  bool operator ==(covariant PickCountryPicker other) {
    if (identical(this, other)) return true;

    return other.phoneCode == phoneCode && other.flagEmoji == flagEmoji;
  }

  @override
  int get hashCode => phoneCode.hashCode ^ flagEmoji.hashCode;
}
