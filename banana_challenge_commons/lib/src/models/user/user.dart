import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed

/// This is the main DTO model for the user
class User with _$User {
  /// This is the factory constructor for the user
  const factory User({
    /// This is the id of the user
    int? id,

    /// This is the username of the user
    String? username,

    /// This is the email of the user
    String? email,

    /// This is the password of the user
    String? firstName,

    /// This is the password of the user
    String? lastName,

    /// This is the password of the user
    String? gender,

    /// This is the password of the user
    String? image,
  }) = _User;

  /// Method from json to user
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  const User._();
}
