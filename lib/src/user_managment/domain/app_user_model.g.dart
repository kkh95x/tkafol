// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String,
      typeUser: json['typeUser'] as String?,
      rangOfStars: json['rangOfStars'] as int?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      cityName: json['cityName'] as String?,
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'typeUser': instance.typeUser,
      'rangOfStars': instance.rangOfStars,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'cityName': instance.cityName,
    };
