import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_boiler_plate/repositories/repository.dart';

class Hymn extends Equatable {
  final id;
  final title;
  final description;
  final totalNumOfSongs;
  final songs;

  Hymn(this.title,
      {String description = '',
      String totalNumOfSongs = '',
      List<dynamic> songs,
      String id})
      : this.description = description ?? '',
        this.totalNumOfSongs = totalNumOfSongs ?? '',
        this.songs = songs ?? '',
        this.id = id ?? '';

  Hymn copyWith(
      {String title,
      String description,
      String totalNumOfSongs,
      List<dynamic> songs,
      String id}) {
    return Hymn(title ?? this.title,
        description: description ?? this.description,
        totalNumOfSongs: totalNumOfSongs ?? this.totalNumOfSongs,
        id: id ?? this.id);
  }

  @override
  List<Object> get props => [title, description, totalNumOfSongs, songs, id];

  @override
  String toString() {
    return 'Hymn {title: $title, description: $description, totalNumOfSongs: $totalNumOfSongs, songs: $songs, id: $id}';
  }

  HymnEntity toEntity() {
    return HymnEntity(title, description, totalNumOfSongs, songs, id);
  }

  static Hymn fromEntity(HymnEntity entity) {
    return Hymn(entity.title,
        description: entity.description,
        totalNumOfSongs: entity.totalNumOfSongs,
        songs: entity.songs,
        id: entity.id);
  }
}
