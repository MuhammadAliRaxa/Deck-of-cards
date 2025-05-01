// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
class CardT {
  String code;
  String image;
  String value;
  Map<String,dynamic> images;
  String suit;
  CardT({
    required this.code,
    required this.image,
    required this.value,
    required this.images,
    required this.suit,
  });
  

  CardT copyWith({
    String? code,
    String? image,
    String? value,
    Map<String,dynamic>? images,
    String? suit,
  }) {
    return CardT(
      code: code ?? this.code,
      image: image ?? this.image,
      value: value ?? this.value,
      images: images ?? this.images,
      suit: suit ?? this.suit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'image': image,
      'value': value,
      'images': images,
      'suit': suit,
    };
  }

  factory CardT.fromMap(Map<String, dynamic> map) {
    return CardT(
      code: map['code'] as String,
      image: map['image'] as String,
      value: map['value'] as String,
      images: Map<String,dynamic>.from((map['images'] as Map<String,dynamic>)),
      suit: map['suit'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CardT.fromJson(String source) => CardT.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CardT(code: $code, image: $image, value: $value, images: $images, suit: $suit)';
  }

  @override
  bool operator ==(covariant CardT other) {
    if (identical(this, other)) return true;
  
    return 
      other.code == code &&
      other.image == image &&
      other.value == value &&
      mapEquals(other.images, images) &&
      other.suit == suit;
  }

  @override
  int get hashCode {
    return code.hashCode ^
      image.hashCode ^
      value.hashCode ^
      images.hashCode ^
      suit.hashCode;
  }
}
