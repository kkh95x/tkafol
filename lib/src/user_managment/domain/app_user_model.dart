import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'app_user_model.freezed.dart';
part 'app_user_model.g.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String? id,
     String? firstName,
     String? lastName,
    required String email,
    String? typeUser,
    int? rangOfStars,
    double? latitude,
    double? longitude,
    String? cityName,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, Object?> json) =>
      _$AppUserFromJson(json);
}

enum TypeUser { needy, benefactor }

extension GetString on TypeUser {
  String getStringNameTypeUser() {
    switch (this) {
   
      case TypeUser.benefactor:
        return "benefactor";
      case TypeUser.needy:
        return "needy";

      default:
        return "";
    }
  }
}
