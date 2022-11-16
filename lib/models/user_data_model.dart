import 'package:json_annotation/json_annotation.dart';

// Generado con "dart run build_runner build"
part 'user_data_model.g.dart';

@JsonSerializable()
class UserData {
  String uid;
  String? name;
  String email;
  bool isAdmin;
  String? imageURL;
  List<String>? favMovies;
  List<String>? pendingMovies;
  List<String>? watchedMovies;

  UserData(
      {required this.uid,
      this.name,
      required this.email,
      this.isAdmin = false,
      this.imageURL,
      this.favMovies,
      this.pendingMovies,
      this.watchedMovies});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
