// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatModel _$$_ChatModelFromJson(Map<String, dynamic> json) => _$_ChatModel(
      id: json['id'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      emailBenefactorUSer: json['emailBenefactorUSer'] as String,
      emailNeedyUser: json['emailNeedyUser'] as String,
      idBenefactorUSer: json['idBenefactorUSer'] as String,
      idNeedyUser: json['idNeedyUser'] as String,
      finished: json['finished'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ChatModelToJson(_$_ChatModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.created_at?.toIso8601String(),
      'emailBenefactorUSer': instance.emailBenefactorUSer,
      'emailNeedyUser': instance.emailNeedyUser,
      'idBenefactorUSer': instance.idBenefactorUSer,
      'idNeedyUser': instance.idNeedyUser,
      'finished': instance.finished,
    };
