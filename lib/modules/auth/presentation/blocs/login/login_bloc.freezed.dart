// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState {
  ResponseStatus get submitStatus => throw _privateConstructorUsedError;
  UserLoginResponseEntity? get userLoginResponse =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {ResponseStatus submitStatus,
      UserLoginResponseEntity? userLoginResponse});

  $ResponseStatusCopyWith<$Res> get submitStatus;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? submitStatus = null,
    Object? userLoginResponse = freezed,
  }) {
    return _then(_value.copyWith(
      submitStatus: null == submitStatus
          ? _value.submitStatus
          : submitStatus // ignore: cast_nullable_to_non_nullable
              as ResponseStatus,
      userLoginResponse: freezed == userLoginResponse
          ? _value.userLoginResponse
          : userLoginResponse // ignore: cast_nullable_to_non_nullable
              as UserLoginResponseEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResponseStatusCopyWith<$Res> get submitStatus {
    return $ResponseStatusCopyWith<$Res>(_value.submitStatus, (value) {
      return _then(_value.copyWith(submitStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
          _$LoginStateImpl value, $Res Function(_$LoginStateImpl) then) =
      __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ResponseStatus submitStatus,
      UserLoginResponseEntity? userLoginResponse});

  @override
  $ResponseStatusCopyWith<$Res> get submitStatus;
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
      _$LoginStateImpl _value, $Res Function(_$LoginStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? submitStatus = null,
    Object? userLoginResponse = freezed,
  }) {
    return _then(_$LoginStateImpl(
      submitStatus: null == submitStatus
          ? _value.submitStatus
          : submitStatus // ignore: cast_nullable_to_non_nullable
              as ResponseStatus,
      userLoginResponse: freezed == userLoginResponse
          ? _value.userLoginResponse
          : userLoginResponse // ignore: cast_nullable_to_non_nullable
              as UserLoginResponseEntity?,
    ));
  }
}

/// @nodoc

class _$LoginStateImpl implements _LoginState {
  const _$LoginStateImpl(
      {this.submitStatus = ResponseStatus.initial, this.userLoginResponse});

  @override
  @JsonKey()
  final ResponseStatus submitStatus;
  @override
  final UserLoginResponseEntity? userLoginResponse;

  @override
  String toString() {
    return 'LoginState(submitStatus: $submitStatus, userLoginResponse: $userLoginResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.submitStatus, submitStatus) ||
                other.submitStatus == submitStatus) &&
            (identical(other.userLoginResponse, userLoginResponse) ||
                other.userLoginResponse == userLoginResponse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, submitStatus, userLoginResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState(
      {final ResponseStatus submitStatus,
      final UserLoginResponseEntity? userLoginResponse}) = _$LoginStateImpl;

  @override
  ResponseStatus get submitStatus;
  @override
  UserLoginResponseEntity? get userLoginResponse;
  @override
  @JsonKey(ignore: true)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ResponseStatus {
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResponseStatusCopyWith<ResponseStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseStatusCopyWith<$Res> {
  factory $ResponseStatusCopyWith(
          ResponseStatus value, $Res Function(ResponseStatus) then) =
      _$ResponseStatusCopyWithImpl<$Res, ResponseStatus>;
  @useResult
  $Res call({FormzSubmissionStatus status, String? message});
}

/// @nodoc
class _$ResponseStatusCopyWithImpl<$Res, $Val extends ResponseStatus>
    implements $ResponseStatusCopyWith<$Res> {
  _$ResponseStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseStatusImplCopyWith<$Res>
    implements $ResponseStatusCopyWith<$Res> {
  factory _$$ResponseStatusImplCopyWith(_$ResponseStatusImpl value,
          $Res Function(_$ResponseStatusImpl) then) =
      __$$ResponseStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FormzSubmissionStatus status, String? message});
}

/// @nodoc
class __$$ResponseStatusImplCopyWithImpl<$Res>
    extends _$ResponseStatusCopyWithImpl<$Res, _$ResponseStatusImpl>
    implements _$$ResponseStatusImplCopyWith<$Res> {
  __$$ResponseStatusImplCopyWithImpl(
      _$ResponseStatusImpl _value, $Res Function(_$ResponseStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
  }) {
    return _then(_$ResponseStatusImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ResponseStatusImpl implements _ResponseStatus {
  const _$ResponseStatusImpl({required this.status, this.message});

  @override
  final FormzSubmissionStatus status;
  @override
  final String? message;

  @override
  String toString() {
    return 'ResponseStatus(status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseStatusImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseStatusImplCopyWith<_$ResponseStatusImpl> get copyWith =>
      __$$ResponseStatusImplCopyWithImpl<_$ResponseStatusImpl>(
          this, _$identity);
}

abstract class _ResponseStatus implements ResponseStatus {
  const factory _ResponseStatus(
      {required final FormzSubmissionStatus status,
      final String? message}) = _$ResponseStatusImpl;

  @override
  FormzSubmissionStatus get status;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$ResponseStatusImplCopyWith<_$ResponseStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
