import 'package:dartz/dartz.dart';
import 'package:tdd_clean_architecture/core/errors/failures.dart';
import 'package:tdd_clean_architecture/feature/domain/entities/space_media_entity.dart';

abstract class ISpaceMediaRepository {
  Future<Either<Failure,SpaceMediaEntity>> getSpaceMediaFromDate();
}