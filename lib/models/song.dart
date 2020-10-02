import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_boiler_plate/repositories/song_entity.dart';

class Song extends Equatable {
  final id;
  final hymnId;
  final title;
  final songNumber;
  final verses;
  final similarTune;
  final alternateTune;

  Song(this.title,
      {String id,
      int hymnId,
      String songNumber,
      List<dynamic> verses,
      List<dynamic> similarTune,
      List<dynamic> alternateTune})
      : this.id = id ?? '',
        this.hymnId = hymnId ?? '',
        this.songNumber = songNumber ?? '',
        this.verses = verses ?? '',
        this.similarTune = similarTune ?? '',
        this.alternateTune = alternateTune ?? '';

  Song copyWith(
      {String title,
      String id,
      int hymnId,
      String songNymber,
      List<dynamic> verses,
      List<dynamic> similarTune,
      List<dynamic> alteranteTune}) {
    return Song(title ?? this.title,
        id: this.id,
        hymnId: this.hymnId,
        songNumber: this.songNumber,
        verses: this.verses,
        similarTune: this.similarTune,
        alternateTune: this.alternateTune);
  }

  @override
  List<Object> get props =>
      [title, id, hymnId, songNumber, verses, similarTune, alternateTune];
  @override
  String toString() {
    return 'SOng {id: $id,hymnId: $hymnId, title: $title, songNumber: $songNumber, verses: $verses, similarTune: $similarTune, alternateTune: $alternateTune}';
  }

  SongEntity toEntity() {
    return SongEntity(
        id, hymnId, title, songNumber, verses, similarTune, alternateTune);
  }

  static Song fromEntity(SongEntity entity) {
    return Song(entity.title,
        id: entity.id,
        hymnId: entity.hymnId,
        songNumber: entity.songNumber,
        verses: entity.verses,
        similarTune: entity.similarTune,
        alternateTune: entity.alternateTune);
  }
}
