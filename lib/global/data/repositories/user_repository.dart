
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/failure.dart';
import '../models/user.dart';
import '_base_repository.dart';

final userRepositoryProvider = Provider(
  (ref) => _UserRepositoryImpl(),
);

abstract class UserRepository {
  Future<Either<Failure, User>> getMe();

  Future<Either<Failure, User>> updateMe({
    String? fcmToken,
  });
}

class _UserRepositoryImpl extends BaseRepository implements UserRepository {
  final userRef =
      FirebaseFirestore.instance.collection('users').withUserConverter();

  @override
  Future<Either<Failure, User>> getMe() {
    return guardFuture(() async {
      final uid = fb.FirebaseAuth.instance.currentUser?.uid;
      final res = await userRef.doc(uid).get();
      return res.data()!;
    });
  }

  @override
  Future<Either<Failure, User>> updateMe({
    String? fcmToken,
  }) {
    final uid = fb.FirebaseAuth.instance.currentUser?.uid;
    return guardFuture(() async {
      final user = (await userRef.doc(uid).get()).data();
      if (user == null) throw Exception('User not found');
      final mergeUser = user.copyWith(
        fcmToken: fcmToken ?? user.fcmToken,
      );
      await userRef.doc(uid).set(mergeUser);
      return mergeUser;
    });
  }
}
