// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_credentials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginCredentials {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginCredentialsCopyWith<LoginCredentials> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginCredentialsCopyWith<$Res> {
  factory $LoginCredentialsCopyWith(
          LoginCredentials value, $Res Function(LoginCredentials) then) =
      _$LoginCredentialsCopyWithImpl<$Res, LoginCredentials>;
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class _$LoginCredentialsCopyWithImpl<$Res, $Val extends LoginCredentials>
    implements $LoginCredentialsCopyWith<$Res> {
  _$LoginCredentialsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginCredentialsImplCopyWith<$Res>
    implements $LoginCredentialsCopyWith<$Res> {
  factory _$$LoginCredentialsImplCopyWith(_$LoginCredentialsImpl value,
          $Res Function(_$LoginCredentialsImpl) then) =
      __$$LoginCredentialsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class __$$LoginCredentialsImplCopyWithImpl<$Res>
    extends _$LoginCredentialsCopyWithImpl<$Res, _$LoginCredentialsImpl>
    implements _$$LoginCredentialsImplCopyWith<$Res> {
  __$$LoginCredentialsImplCopyWithImpl(_$LoginCredentialsImpl _value,
      $Res Function(_$LoginCredentialsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$LoginCredentialsImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginCredentialsImpl implements _LoginCredentials {
  const _$LoginCredentialsImpl(
      {required this.username, required this.password});

  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginCredentials(username: $username, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginCredentialsImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginCredentialsImplCopyWith<_$LoginCredentialsImpl> get copyWith =>
      __$$LoginCredentialsImplCopyWithImpl<_$LoginCredentialsImpl>(
          this, _$identity);
}

abstract class _LoginCredentials implements LoginCredentials {
  const factory _LoginCredentials(
      {required final String username,
      required final String password}) = _$LoginCredentialsImpl;

  @override
  String get username;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$LoginCredentialsImplCopyWith<_$LoginCredentialsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
