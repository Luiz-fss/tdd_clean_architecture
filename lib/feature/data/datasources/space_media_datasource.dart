import 'package:tdd_clean_architecture/feature/data/models/space_media_model.dart';

abstract class ISpaceMediaDatasource {

  Future<SpaceMediaModel> getSpaceMediaFromDate (DateTime date);
}