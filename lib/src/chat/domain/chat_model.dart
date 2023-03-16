import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:takafol/src/chat/domain/donation_model.dart';
import 'package:takafol/src/chat/domain/massage_model.dart';
part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class ChatModel with _$ChatModel {
  const factory ChatModel({
    String? id,
    DateTime? created_at,
    required String emailBenefactorUSer,
    required String emailNeedyUser,
     required String idBenefactorUSer,
    required String idNeedyUser,
     @Default(false) bool finished
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, Object?> json) =>
      _$ChatModelFromJson(json);
}