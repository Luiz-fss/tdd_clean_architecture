import 'package:dartz/dartz.dart';
import 'package:tdd_clean_architecture/core/errors/failures.dart';
import 'package:tdd_clean_architecture/core/usecase/usecase.dart';
import 'package:tdd_clean_architecture/feature/domain/entities/space_media_entity.dart';
import 'package:tdd_clean_architecture/feature/domain/repositories/i_space_media_repository.dart';


class GetSpaceMediaFromDateUsecase extends Usecase<SpaceMediaEntity,DateTime>{
  final ISpaceMediaRepository repository;

  GetSpaceMediaFromDateUsecase(this.repository);
  @override
  Future<Either<Failure, SpaceMediaEntity>> call(DateTime date) async{
   return await repository.getSpaceMediaFromDate(date);
  }
}