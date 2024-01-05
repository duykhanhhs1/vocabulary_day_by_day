// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      id: json['id'] as int,
      userName: json['userName'] as String,
      fullName: json['fullName'] as String,
      defaultTenantId: json['defaultTenantId'] as int?,
      isAlreadyRequestLicense: json['isAlreadyRequestLicense'] as bool?,
      isTenantManager: json['isTenantManager'] as bool? ?? false,
      isRootTenant: json['isRootTenant'] as bool? ?? false,
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'defaultTenantId': instance.defaultTenantId,
      'isTenantManager': instance.isTenantManager,
      'isRootTenant': instance.isRootTenant,
      'isAlreadyRequestLicense': instance.isAlreadyRequestLicense,
      'fullName': instance.fullName,
      'features': instance.features,
    };

UserLoginCredentialsEntity _$UserLoginCredentialsEntityFromJson(
        Map<String, dynamic> json) =>
    UserLoginCredentialsEntity(
      username: json['username'] as String,
      password: json['password'] as String,
    )..isKeepSignedIn = json['isKeepSignedIn'] as bool;

Map<String, dynamic> _$UserLoginCredentialsEntityToJson(
        UserLoginCredentialsEntity instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'isKeepSignedIn': instance.isKeepSignedIn,
    };

UserLoginResponseEntity _$UserLoginResponseEntityFromJson(
        Map<String, dynamic> json) =>
    UserLoginResponseEntity(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresIn: json['expiresIn'] as int,
      homeUrl: json['homeUrl'] as String?,
      imageToken: json['imageToken'] as String?,
      tokenType: json['tokenType'] as String?,
      sessionId: json['sessionId'] as String?,
    );

Map<String, dynamic> _$UserLoginResponseEntityToJson(
        UserLoginResponseEntity instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'tokenType': instance.tokenType,
      'imageToken': instance.imageToken,
      'homeUrl': instance.homeUrl,
      'expiresIn': instance.expiresIn,
      'sessionId': instance.sessionId,
    };
