// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      uid: json['uid'] as String,
      name: json['name'] as String?,
      email: json['email'] as String,
      isAdmin: json['isAdmin'] as bool? ?? false,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'isAdmin': instance.isAdmin,
    };
