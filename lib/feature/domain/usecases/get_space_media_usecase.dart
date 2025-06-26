import 'package:dartz/dartz.dart';
import 'package:tdd_clean_architecture/core/errors/failures.dart';
import 'package:tdd_clean_architecture/core/usecase/usecase.dart';
import 'package:tdd_clean_architecture/feature/domain/entities/space_media_entity.dart';
import 'package:tdd_clean_architecture/feature/domain/repositories/i_space_media_repository.dart';


class GetSpaceMediaUsecase extends Usecase<SpaceMediaEntity,NoParams>{
  final ISpaceMediaRepository repository;

  GetSpaceMediaUsecase(this.repository);
  @override
  Future<Either<Failure, SpaceMediaEntity>> call(NoParams params) async{
   return await repository.getSpaceMediaFromDate();
  }
}