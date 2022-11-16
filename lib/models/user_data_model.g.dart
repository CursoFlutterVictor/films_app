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
      imageURL: json['imageURL'] as String?,
      favMovies: (json['favMovies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      pendingMovies: (json['pendingMovies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      watchedMovies: (json['watchedMovies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'isAdmin': instance.isAdmin,
      'imageURL': instance.imageURL,
      'favMovies': instance.favMovies,
      'pendingMovies': instance.pendingMovies,
      'watchedMovies': instance.watchedMovies,
    };
