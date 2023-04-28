
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.unknown(Object data) = _unknownFailure;

  const factory Failure.firebase(FirebaseException e) = _firebaseFailure;

  const factory Failure.illegalData(Object data) = _illegalDataFailure;

  const factory Failure.network() = _networkFailure;

  const factory Failure.permissionDenied() = _permissionDeniedFailure;

  const factory Failure.other(String message) = _otherFailure;
}
