import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/fauiler.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
}

class NoParam {}