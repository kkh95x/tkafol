// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'massage_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MassageModle _$MassageModleFromJson(Map<String, dynamic> json) {
  return _MassageModle.fromJson(json);
}

/// @nodoc
mixin _$MassageModle {
  String get idChat => throw _privateConstructorUsedError;
  String? get emailSender => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  DateTime? get created_at => throw _privateConstructorUsedError;
  bool get seen => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MassageModleCopyWith<MassageModle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MassageModleCopyWith<$Res> {
  factory $MassageModleCopyWith(
          MassageModle value, $Res Function(MassageModle) then) =
      _$MassageModleCopyWithImpl<$Res, MassageModle>;
  @useResult
  $Res call(
      {String idChat,
      String? emailSender,
      String? value,
      DateTime? created_at,
      bool seen});
}

/// @nodoc
class _$MassageModleCopyWithImpl<$Res, $Val extends MassageModle>
    implements $MassageModleCopyWith<$Res> {
  _$MassageModleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idChat = null,
    Object? emailSender = freezed,
    Object? value = freezed,
    Object? created_at = freezed,
    Object? seen = null,
  }) {
    return _then(_value.copyWith(
      idChat: null == idChat
          ? _value.idChat
          : idChat // ignore: cast_nullable_to_non_nullable
              as String,
      emailSender: freezed == emailSender
          ? _value.emailSender
          : emailSender // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      seen: null == seen
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MassageModleCopyWith<$Res>
    implements $MassageModleCopyWith<$Res> {
  factory _$$_MassageModleCopyWith(
          _$_MassageModle value, $Res Function(_$_MassageModle) then) =
      __$$_MassageModleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idChat,
      String? emailSender,
      String? value,
      DateTime? created_at,
      bool seen});
}

/// @nodoc
class __$$_MassageModleCopyWithImpl<$Res>
    extends _$MassageModleCopyWithImpl<$Res, _$_MassageModle>
    implements _$$_MassageModleCopyWith<$Res> {
  __$$_MassageModleCopyWithImpl(
      _$_MassageModle _value, $Res Function(_$_MassageModle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idChat = null,
    Object? emailSender = freezed,
    Object? value = freezed,
    Object? created_at = freezed,
    Object? seen = null,
  }) {
    return _then(_$_MassageModle(
      idChat: null == idChat
          ? _value.idChat
          : idChat // ignore: cast_nullable_to_non_nullable
              as String,
      emailSender: freezed == emailSender
          ? _value.emailSender
          : emailSender // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      seen: null == seen
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MassageModle with DiagnosticableTreeMixin implements _MassageModle {
  const _$_MassageModle(
      {required this.idChat,
      this.emailSender,
      this.value,
      this.created_at,
      this.seen = false});

  factory _$_MassageModle.fromJson(Map<String, dynamic> json) =>
      _$$_MassageModleFromJson(json);

  @override
  final String idChat;
  @override
  final String? emailSender;
  @override
  final String? value;
  @override
  final DateTime? created_at;
  @override
  @JsonKey()
  final bool seen;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MassageModle(idChat: $idChat, emailSender: $emailSender, value: $value, created_at: $created_at, seen: $seen)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MassageModle'))
      ..add(DiagnosticsProperty('idChat', idChat))
      ..add(DiagnosticsProperty('emailSender', emailSender))
      ..add(DiagnosticsProperty('value', value))
      ..add(DiagnosticsProperty('created_at', created_at))
      ..add(DiagnosticsProperty('seen', seen));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MassageModle &&
            (identical(other.idChat, idChat) || other.idChat == idChat) &&
            (identical(other.emailSender, emailSender) ||
                other.emailSender == emailSender) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.seen, seen) || other.seen == seen));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idChat, emailSender, value, created_at, seen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MassageModleCopyWith<_$_MassageModle> get copyWith =>
      __$$_MassageModleCopyWithImpl<_$_MassageModle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MassageModleToJson(
      this,
    );
  }
}

abstract class _MassageModle implements MassageModle {
  const factory _MassageModle(
      {required final String idChat,
      final String? emailSender,
      final String? value,
      final DateTime? created_at,
      final bool seen}) = _$_MassageModle;

  factory _MassageModle.fromJson(Map<String, dynamic> json) =
      _$_MassageModle.fromJson;

  @override
  String get idChat;
  @override
  String? get emailSender;
  @override
  String? get value;
  @override
  DateTime? get created_at;
  @override
  bool get seen;
  @override
  @JsonKey(ignore: true)
  _$$_MassageModleCopyWith<_$_MassageModle> get copyWith =>
      throw _privateConstructorUsedError;
}
