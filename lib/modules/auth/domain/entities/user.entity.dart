import 'package:vocabulary_day_by_day/common/utils/datetime.util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.entity.g.dart';

@JsonSerializable(explicitToJson: true)
@JsonSerializableDateTime()
class UserEntity {
  final int id;
  final String userName;
  int? defaultTenantId;
  final bool isTenantManager;
  final bool isRootTenant;
  final bool? isAlreadyRequestLicense;
  String fullName;
  List<String> features;

  UserEntity({
    required this.id,
    required this.userName,
    required this.fullName,
    this.defaultTenantId,
    this.isAlreadyRequestLicense,
    this.isTenantManager = false,
    this.isRootTenant = false,
    this.features = const [],
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}

@JsonSerializable()
class UserLoginCredentialsEntity {
  String username;
  String password;
  bool isKeepSignedIn = true;

  UserLoginCredentialsEntity({
    required this.username,
    required this.password,
  });

  factory UserLoginCredentialsEntity.fromJson(Map<String, dynamic> json) =>
      _$UserLoginCredentialsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginCredentialsEntityToJson(this);
}

@JsonSerializable()
class UserLoginResponseEntity {
  String accessToken;
  String refreshToken;
  String? tokenType;
  String? imageToken;
  String? homeUrl;
  int expiresIn;
  String? sessionId;

  UserLoginResponseEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    this.homeUrl,
    this.imageToken,
    this.tokenType,
    this.sessionId,
  });

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$UserLoginResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginResponseEntityToJson(this);
}
