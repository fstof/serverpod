/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

/// Information about an email password reset.
abstract class EmailPasswordReset extends _i1.SerializableEntity {
  EmailPasswordReset._({
    required this.userName,
    required this.email,
  });

  factory EmailPasswordReset({
    required String userName,
    required String email,
  }) = _EmailPasswordResetImpl;

  factory EmailPasswordReset.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return EmailPasswordReset(
      userName: serializationManager
          .deserialize<String>(jsonSerialization['userName']),
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
    );
  }

  /// The user name of the user.
  String userName;

  /// The email of the user.
  String email;

  EmailPasswordReset copyWith({
    String? userName,
    String? email,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'userName': userName,
      'email': email,
    };
  }
}

class _EmailPasswordResetImpl extends EmailPasswordReset {
  _EmailPasswordResetImpl({
    required String userName,
    required String email,
  }) : super._(
          userName: userName,
          email: email,
        );

  @override
  EmailPasswordReset copyWith({
    String? userName,
    String? email,
  }) {
    return EmailPasswordReset(
      userName: userName ?? this.userName,
      email: email ?? this.email,
    );
  }
}
