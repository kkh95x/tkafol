// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DonationModel _$$_DonationModelFromJson(Map<String, dynamic> json) =>
    _$_DonationModel(
      id: json['id'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      emailBenefactorUSer: json['emailBenefactorUSer'] as String,
      emailNeedyUser: json['emailNeedyUser'] as String,
      idChat: json['idChat'] as String,
      typeDonation: json['typeDonation'] as String?,
      count: json['count'] as String?,
      location: json['location'] as String?,
      weight: json['weight'] as String?,
      waitingTime: json['waitingTime'] as String?,
      notes: json['notes'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      accepted: json['accepted'] as bool? ?? false,
      receive: json['receive'] as bool? ?? false,
    );

Map<String, dynamic> _$$_DonationModelToJson(_$_DonationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.created_at?.toIso8601String(),
      'emailBenefactorUSer': instance.emailBenefactorUSer,
      'emailNeedyUser': instance.emailNeedyUser,
      'idChat': instance.idChat,
      'typeDonation': instance.typeDonation,
      'count': instance.count,
      'location': instance.location,
      'weight': instance.weight,
      'waitingTime': instance.waitingTime,
      'notes': instance.notes,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'accepted': instance.accepted,
      'receive': instance.receive,
    };
