import 'package:tdd_clean_architecture/feature/domain/entities/space_media_entity.dart';

class SpaceMediaModel extends SpaceMediaEntity {
  SpaceMediaModel(
      {required super.description,
      required super.title,
      required super.mediaType,
      required super.mediaUrl});

  factory SpaceMediaModel.fromJson(Map<String,dynamic>json){
    return SpaceMediaModel(
      description: json["explanation"],
      mediaType: json["media_type"],
      title: json["title"],
      mediaUrl: json["url"]
    );
  }

  Map<String,dynamic> toJson(){
    return{
      "explanation": description,
      "media_type":mediaType,
      "title":title,
      "url":mediaUrl
    };
  }
}
