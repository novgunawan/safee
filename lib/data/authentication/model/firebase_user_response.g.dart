// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirebaseUserResponse _$FirebaseUserResponseFromJson(
        Map<String, dynamic> json) =>
    FirebaseUserResponse(
      json['displayName'] as String,
      json['email'] as String,
      json['photoURL'] as String,
    );

Map<String, dynamic> _$FirebaseUserResponseToJson(
        FirebaseUserResponse instance) =>
    <String, dynamic>{
      'displayName': instance.name,
      'email': instance.email,
      'photoURL': instance.picture,
    };
