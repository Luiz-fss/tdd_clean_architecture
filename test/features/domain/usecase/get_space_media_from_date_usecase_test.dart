import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_architecture/core/errors/failures.dart';
import 'package:tdd_clean_architecture/core/usecase/usecase.dart';
import 'package:tdd_clean_architecture/feature/domain/entities/space_media_entity.dart';
import 'package:tdd_clean_architecture/feature/domain/repositories/i_space_media_repository.dart';
import 'package:tdd_clean_architecture/feature/domain/usecases/get_space_media_from_date_usecase.dart';

class MockSpaceMediaRepository extends Mock implements ISpaceMediaRepository{}

void main(){
  late GetSpaceMediaFromDateUsecase usecase;
  late ISpaceMediaRepository repository;

  setUp((){
    repository = MockSpaceMediaRepository();
    usecase = GetSpaceMediaFromDateUsecase(repository);
  });

  final tSpaceMedia = SpaceMediaEntity(description: "description", title: "title", mediaType: "image", mediaUrl: "mediaUrl");
  final tNoParams = NoParams();
  final tDate = DateTime(2025,08,26);
  test(
    "Should get space media for a given date from the repository",
    ()async{
     when(()=> repository.getSpaceMediaFromDate(tDate)).thenAnswer((_)async=> Right<Failure,SpaceMediaEntity>(tSpaceMedia));
     final result = await usecase(tDate);
     expect(result, Right(tSpaceMedia));
     verify(() => repository.getSpaceMediaFromDate(tDate)).called(1);
    },);

  test(
    "Should retur a failure when dont success",
        ()async{
      when(()=> repository.getSpaceMediaFromDate(tDate)).thenAnswer((_)async=> Left<Failure,SpaceMediaEntity>(ServerFailure()));
      final result = await usecase(tDate);
      expect(result, Left(ServerFailure()));
      verify(() => repository.getSpaceMediaFromDate(tDate)).called(1);
    },);
}