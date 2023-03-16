import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'massage_model.freezed.dart';
part 'massage_model.g.dart';
@freezed
class MassageModle with _$MassageModle{
  const factory MassageModle({
    required String idChat,
    String? emailSender,
    String? value,
    DateTime? created_at,
   @Default(false) bool seen,  
  }) = _MassageModle;

  factory MassageModle.fromJson(Map<String, Object?> json) =>
      _$MassageModleFromJson(json);
}
