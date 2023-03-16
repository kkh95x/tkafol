import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'donation_model.freezed.dart';
part 'donation_model.g.dart';

@freezed
class DonationModel with _$DonationModel {
  const factory DonationModel({
    String? id,
     DateTime? created_at,
    required String emailBenefactorUSer,
    required String emailNeedyUser,
    required String idChat,
    String? typeDonation,
    String? count,
    String? location,
    String? weight,
    String? waitingTime,
    String? notes,
    double? latitude,
    double? longitude,
    @Default(false) bool accepted,
    @Default(false) bool receive,
  }) = _DonationModel;

  factory DonationModel.fromJson(Map<String, Object?> json) =>
      _$DonationModelFromJson(json);
}
