
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../models/failure.dart';

class BaseRepository {
  Future<Either<Failure, T>> guardFuture<T>(
    Future<T> Function() future,
  ) async {
    try {
      return right(await future());
    } on FirebaseException catch (e) {
      print('firebase $e');
      return left(Failure.firebase(e));
    } catch (e, __) {
      print('Stack trace: $__');
      return left(Failure.unknown(e));
    }
  }

  Either<Failure, T> guard<T>(T Function() body) {
    try {
      return right(body());
    } catch (e) {
      return left(Failure.unknown(e));
    }
  }
}
