// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'massage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MassageModle _$$_MassageModleFromJson(Map<String, dynamic> json) =>
    _$_MassageModle(
      idChat: json['idChat'] as String,
      emailSender: json['emailSender'] as String?,
      value: json['value'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      seen: json['seen'] as bool? ?? false,
    );

Map<String, dynamic> _$$_MassageModleToJson(_$_MassageModle instance) =>
    <String, dynamic>{
      'idChat': instance.idChat,
      'emailSender': instance.emailSender,
      'value': instance.value,
      'created_at': instance.created_at?.toIso8601String(),
      'seen': instance.seen,
    };
