// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
mixin _$AppUser {
  String? get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get typeUser => throw _privateConstructorUsedError;
  int? get rangOfStars => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  String? get cityName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call(
      {String? id,
      String? firstName,
      String? lastName,
      String email,
      String? typeUser,
      int? rangOfStars,
      double? latitude,
      double? longitude,
      String? cityName});
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = null,
    Object? typeUser = freezed,
    Object? rangOfStars = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? cityName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      typeUser: freezed == typeUser
          ? _value.typeUser
          : typeUser // ignore: cast_nullable_to_non_nullable
              as String?,
      rangOfStars: freezed == rangOfStars
          ? _value.rangOfStars
          : rangOfStars // ignore: cast_nullable_to_non_nullable
              as int?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      cityName: freezed == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$_AppUserCopyWith(
          _$_AppUser value, $Res Function(_$_AppUser) then) =
      __$$_AppUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? firstName,
      String? lastName,
      String email,
      String? typeUser,
      int? rangOfStars,
      double? latitude,
      double? longitude,
      String? cityName});
}

/// @nodoc
class __$$_AppUserCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$_AppUser>
    implements _$$_AppUserCopyWith<$Res> {
  __$$_AppUserCopyWithImpl(_$_AppUser _value, $Res Function(_$_AppUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = null,
    Object? typeUser = freezed,
    Object? rangOfStars = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? cityName = freezed,
  }) {
    return _then(_$_AppUser(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      typeUser: freezed == typeUser
          ? _value.typeUser
          : typeUser // ignore: cast_nullable_to_non_nullable
              as String?,
      rangOfStars: freezed == rangOfStars
          ? _value.rangOfStars
          : rangOfStars // ignore: cast_nullable_to_non_nullable
              as int?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      cityName: freezed == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppUser with DiagnosticableTreeMixin implements _AppUser {
  const _$_AppUser(
      {required this.id,
      this.firstName,
      this.lastName,
      required this.email,
      this.typeUser,
      this.rangOfStars,
      this.latitude,
      this.longitude,
      this.cityName});

  factory _$_AppUser.fromJson(Map<String, dynamic> json) =>
      _$$_AppUserFromJson(json);

  @override
  final String? id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String email;
  @override
  final String? typeUser;
  @override
  final int? rangOfStars;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? cityName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppUser(id: $id, firstName: $firstName, lastName: $lastName, email: $email, typeUser: $typeUser, rangOfStars: $rangOfStars, latitude: $latitude, longitude: $longitude, cityName: $cityName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppUser'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('typeUser', typeUser))
      ..add(DiagnosticsProperty('rangOfStars', rangOfStars))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude))
      ..add(DiagnosticsProperty('cityName', cityName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.typeUser, typeUser) ||
                other.typeUser == typeUser) &&
            (identical(other.rangOfStars, rangOfStars) ||
                other.rangOfStars == rangOfStars) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, email,
      typeUser, rangOfStars, latitude, longitude, cityName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      __$$_AppUserCopyWithImpl<_$_AppUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppUserToJson(
      this,
    );
  }
}

abstract class _AppUser implements AppUser {
  const factory _AppUser(
      {required final String? id,
      final String? firstName,
      final String? lastName,
      required final String email,
      final String? typeUser,
      final int? rangOfStars,
      final double? latitude,
      final double? longitude,
      final String? cityName}) = _$_AppUser;

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$_AppUser.fromJson;

  @override
  String? get id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String get email;
  @override
  String? get typeUser;
  @override
  int? get rangOfStars;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  String? get cityName;
  @override
  @JsonKey(ignore: true)
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      throw _privateConstructorUsedError;
}
