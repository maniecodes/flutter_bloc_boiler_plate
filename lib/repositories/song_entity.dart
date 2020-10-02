class SongEntity {
  final id;
  final hymnId;
  final title;
  final songNumber;
  final verses;
  final similarTune;
  final alternateTune;

  SongEntity(this.id, this.hymnId, this.title, this.songNumber, this.verses,
      this.similarTune, this.alternateTune);

  @override
  int get hashCode =>
      id.hashCode ^
      hymnId.hashCode ^
      title.hashCode ^
      songNumber.hashCode ^
      verses.hashCode ^
      similarTune ^
      alternateTune;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SongEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          hymnId == other.hymnId &&
          title == other.title &&
          songNumber == other.songNumber &&
          verses == other.verses &&
          similarTune == other.similarTune &&
          alternateTune == other.alternateTune;

  Map<String, Object> toJson() {
    return {
      'id': id,
      'hymnId': hymnId,
      'title': title,
      'songNumber': songNumber,
      'verses': verses,
      'similarTune': similarTune,
      'alternateTune': alternateTune
    };
  }

  @override
  String toString() {
    return 'SongEntity {id: $id, hymnId: $hymnId, title: $title, songNumber: $songNumber, verses: $verses, similarTune: $similarTune, alternateTune: $alternateTune}';
  }

  static SongEntity fromJson(Map<String, Object> json) {
    print('my json is: $json');
    return SongEntity(
        json['_id'] as String,
        json['hymnId'] as int,
        json['title'] as String,
        json['songNumber'] as String,
        json['verses'] as List<dynamic>,
        json['similarTune'] as List<dynamic>,
        json['alternateTune'] as List<dynamic>);
  }
}
