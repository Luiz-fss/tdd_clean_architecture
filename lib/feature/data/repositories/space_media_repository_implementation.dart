
import 'package:dartz/dartz.dart';
import 'package:tdd_clean_architecture/core/errors/exceptions.dart';
import 'package:tdd_clean_architecture/core/errors/failures.dart';
import 'package:tdd_clean_architecture/feature/domain/entities/space_media_entity.dart';
import 'package:tdd_clean_architecture/feature/domain/repositories/i_space_media_repository.dart';

import '../datasources/space_media_datasource.dart';

class SpaceMediaRepositoryImplementation extends ISpaceMediaRepository{

  final ISpaceMediaDatasource datasource;
  SpaceMediaRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(DateTime date) async{
   try{
     final result = await datasource.getSpaceMediaFromDate(date);
     return Right(result);
   }
   on ServerExceptions{
     return Left(ServerFailure());
   }
  }
}