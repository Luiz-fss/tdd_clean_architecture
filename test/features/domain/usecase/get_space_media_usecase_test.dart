import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_architecture/core/errors/failures.dart';
import 'package:tdd_clean_architecture/core/usecase/usecase.dart';
import 'package:tdd_clean_architecture/feature/domain/entities/space_media_entity.dart';
import 'package:tdd_clean_architecture/feature/domain/repositories/i_space_media_repository.dart';
import 'package:tdd_clean_architecture/feature/domain/usecases/get_space_media_usecase.dart';

class MockSpaceMediaRepository extends Mock implements ISpaceMediaRepository{}

void main(){
  late GetSpaceMediaUsecase usecase;
  late ISpaceMediaRepository repository;

  setUp((){
    repository = MockSpaceMediaRepository();
    usecase = GetSpaceMediaUsecase(repository);
  });

  final tSpaceMedia = SpaceMediaEntity(description: "description", title: "title", mediaType: "image", mediaUrl: "mediaUrl");
  final tNoParams = NoParams();
  test(
    "Should get space media for a given date from the repository",
    ()async{
     when(()=> repository.getSpaceMediaFromDate()).thenAnswer((_)async=> Right<Failure,SpaceMediaEntity>(tSpaceMedia));
     final result = await usecase(tNoParams);
     expect(result, Right(tSpaceMedia));
     verify(() => repository.getSpaceMediaFromDate()).called(1);
    },);
}