import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_boiler_plate/models/song.dart';

abstract class SongsState extends Equatable {
  const SongsState();
  @override
  List<Object> get props => [];
}

class SongsLoadInProgress extends SongsState {}

class SongsLoadSuccess extends SongsState {
  final List<Song> songs;

  const SongsLoadSuccess([this.songs = const []]);

  @override
  List<Object> get props => [songs];

  @override
  String toString() => 'SongsLoadSuccess {songs: $songs}';
}

class SongsLoadFailure extends SongsState {}
