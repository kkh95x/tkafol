// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) {
  return _ChatModel.fromJson(json);
}

/// @nodoc
mixin _$ChatModel {
  String? get id => throw _privateConstructorUsedError;
  DateTime? get created_at => throw _privateConstructorUsedError;
  String get emailBenefactorUSer => throw _privateConstructorUsedError;
  String get emailNeedyUser => throw _privateConstructorUsedError;
  String get idBenefactorUSer => throw _privateConstructorUsedError;
  String get idNeedyUser => throw _privateConstructorUsedError;
  bool get finished => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatModelCopyWith<ChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatModelCopyWith<$Res> {
  factory $ChatModelCopyWith(ChatModel value, $Res Function(ChatModel) then) =
      _$ChatModelCopyWithImpl<$Res, ChatModel>;
  @useResult
  $Res call(
      {String? id,
      DateTime? created_at,
      String emailBenefactorUSer,
      String emailNeedyUser,
      String idBenefactorUSer,
      String idNeedyUser,
      bool finished});
}

/// @nodoc
class _$ChatModelCopyWithImpl<$Res, $Val extends ChatModel>
    implements $ChatModelCopyWith<$Res> {
  _$ChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? created_at = freezed,
    Object? emailBenefactorUSer = null,
    Object? emailNeedyUser = null,
    Object? idBenefactorUSer = null,
    Object? idNeedyUser = null,
    Object? finished = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      emailBenefactorUSer: null == emailBenefactorUSer
          ? _value.emailBenefactorUSer
          : emailBenefactorUSer // ignore: cast_nullable_to_non_nullable
              as String,
      emailNeedyUser: null == emailNeedyUser
          ? _value.emailNeedyUser
          : emailNeedyUser // ignore: cast_nullable_to_non_nullable
              as String,
      idBenefactorUSer: null == idBenefactorUSer
          ? _value.idBenefactorUSer
          : idBenefactorUSer // ignore: cast_nullable_to_non_nullable
              as String,
      idNeedyUser: null == idNeedyUser
          ? _value.idNeedyUser
          : idNeedyUser // ignore: cast_nullable_to_non_nullable
              as String,
      finished: null == finished
          ? _value.finished
          : finished // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatModelCopyWith<$Res> implements $ChatModelCopyWith<$Res> {
  factory _$$_ChatModelCopyWith(
          _$_ChatModel value, $Res Function(_$_ChatModel) then) =
      __$$_ChatModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      DateTime? created_at,
      String emailBenefactorUSer,
      String emailNeedyUser,
      String idBenefactorUSer,
      String idNeedyUser,
      bool finished});
}

/// @nodoc
class __$$_ChatModelCopyWithImpl<$Res>
    extends _$ChatModelCopyWithImpl<$Res, _$_ChatModel>
    implements _$$_ChatModelCopyWith<$Res> {
  __$$_ChatModelCopyWithImpl(
      _$_ChatModel _value, $Res Function(_$_ChatModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? created_at = freezed,
    Object? emailBenefactorUSer = null,
    Object? emailNeedyUser = null,
    Object? idBenefactorUSer = null,
    Object? idNeedyUser = null,
    Object? finished = null,
  }) {
    return _then(_$_ChatModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      emailBenefactorUSer: null == emailBenefactorUSer
          ? _value.emailBenefactorUSer
          : emailBenefactorUSer // ignore: cast_nullable_to_non_nullable
              as String,
      emailNeedyUser: null == emailNeedyUser
          ? _value.emailNeedyUser
          : emailNeedyUser // ignore: cast_nullable_to_non_nullable
              as String,
      idBenefactorUSer: null == idBenefactorUSer
          ? _value.idBenefactorUSer
          : idBenefactorUSer // ignore: cast_nullable_to_non_nullable
              as String,
      idNeedyUser: null == idNeedyUser
          ? _value.idNeedyUser
          : idNeedyUser // ignore: cast_nullable_to_non_nullable
              as String,
      finished: null == finished
          ? _value.finished
          : finished // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatModel with DiagnosticableTreeMixin implements _ChatModel {
  const _$_ChatModel(
      {this.id,
      this.created_at,
      required this.emailBenefactorUSer,
      required this.emailNeedyUser,
      required this.idBenefactorUSer,
      required this.idNeedyUser,
      this.finished = false});

  factory _$_ChatModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChatModelFromJson(json);

  @override
  final String? id;
  @override
  final DateTime? created_at;
  @override
  final String emailBenefactorUSer;
  @override
  final String emailNeedyUser;
  @override
  final String idBenefactorUSer;
  @override
  final String idNeedyUser;
  @override
  @JsonKey()
  final bool finished;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatModel(id: $id, created_at: $created_at, emailBenefactorUSer: $emailBenefactorUSer, emailNeedyUser: $emailNeedyUser, idBenefactorUSer: $idBenefactorUSer, idNeedyUser: $idNeedyUser, finished: $finished)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('created_at', created_at))
      ..add(DiagnosticsProperty('emailBenefactorUSer', emailBenefactorUSer))
      ..add(DiagnosticsProperty('emailNeedyUser', emailNeedyUser))
      ..add(DiagnosticsProperty('idBenefactorUSer', idBenefactorUSer))
      ..add(DiagnosticsProperty('idNeedyUser', idNeedyUser))
      ..add(DiagnosticsProperty('finished', finished));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.emailBenefactorUSer, emailBenefactorUSer) ||
                other.emailBenefactorUSer == emailBenefactorUSer) &&
            (identical(other.emailNeedyUser, emailNeedyUser) ||
                other.emailNeedyUser == emailNeedyUser) &&
            (identical(other.idBenefactorUSer, idBenefactorUSer) ||
                other.idBenefactorUSer == idBenefactorUSer) &&
            (identical(other.idNeedyUser, idNeedyUser) ||
                other.idNeedyUser == idNeedyUser) &&
            (identical(other.finished, finished) ||
                other.finished == finished));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      created_at,
      emailBenefactorUSer,
      emailNeedyUser,
      idBenefactorUSer,
      idNeedyUser,
      finished);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatModelCopyWith<_$_ChatModel> get copyWith =>
      __$$_ChatModelCopyWithImpl<_$_ChatModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatModelToJson(
      this,
    );
  }
}

abstract class _ChatModel implements ChatModel {
  const factory _ChatModel(
      {final String? id,
      final DateTime? created_at,
      required final String emailBenefactorUSer,
      required final String emailNeedyUser,
      required final String idBenefactorUSer,
      required final String idNeedyUser,
      final bool finished}) = _$_ChatModel;

  factory _ChatModel.fromJson(Map<String, dynamic> json) =
      _$_ChatModel.fromJson;

  @override
  String? get id;
  @override
  DateTime? get created_at;
  @override
  String get emailBenefactorUSer;
  @override
  String get emailNeedyUser;
  @override
  String get idBenefactorUSer;
  @override
  String get idNeedyUser;
  @override
  bool get finished;
  @override
  @JsonKey(ignore: true)
  _$$_ChatModelCopyWith<_$_ChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}
