import 'package:equatable/equatable.dart';

class SpaceMediaEntity extends Equatable {
  /*EQUATABLE usado para comparar dois objetos diferentes*/

  final String description;
  final String mediaType;
  final String title;
  final String mediaUrl;

  SpaceMediaEntity(
      {required this.description,
      required this.title,
      required this.mediaType,
      required this.mediaUrl});

  @override
  // TODO: implement props
  List<Object?> get props => [description, title, mediaType, mediaUrl];
}
