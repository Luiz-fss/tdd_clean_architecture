

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_architecture/core/errors/exceptions.dart';
import 'package:tdd_clean_architecture/core/errors/failures.dart';
import 'package:tdd_clean_architecture/feature/data/datasources/space_media_datasource.dart';
import 'package:tdd_clean_architecture/feature/data/models/space_media_model.dart';
import 'package:tdd_clean_architecture/feature/data/repositories/space_media_repository_implementation.dart';

class MockSpaceMediaDatasource extends Mock implements ISpaceMediaDatasource{}
void main(){
  late SpaceMediaRepositoryImplementation repository;
  late ISpaceMediaDatasource datasource;
  
  setUp((){
    datasource = MockSpaceMediaDatasource();
    repository = SpaceMediaRepositoryImplementation(datasource);
  });

  final tSpaceMediaModel = SpaceMediaModel(
    description: "Teste",
    mediaUrl: "https://apod.nasa.gov/apod/image/2508/Wispit4b_eso_960.jpg",
    title: "Teste",
    mediaType: "image"
  );
  final tDate = DateTime(2021,01,01);
  test("Should return space media model whent calls the datasource", ()async{
    //arrange
    when(()=> datasource.getSpaceMediaFromDate(tDate)).thenAnswer((_) async =>tSpaceMediaModel);
    //act
    final result = await repository.getSpaceMediaFromDate(tDate);
    //assert
    expect(result, Right(tSpaceMediaModel));
    verify(() => datasource.getSpaceMediaFromDate(tDate)).called(1);
  });

  test("Should return a server failure when the call to datasource is unsucessfull", ()async{
    //arrange
    when(() => datasource.getSpaceMediaFromDate(tDate))
        .thenThrow(ServerExceptions());
    //act
    final result = await repository.getSpaceMediaFromDate(tDate);
    //assert
    expect(result, Left(ServerFailure()));
    verify(() => datasource.getSpaceMediaFromDate(tDate)).called(1);
  });
}