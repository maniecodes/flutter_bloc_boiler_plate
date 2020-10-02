import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boiler_plate/blocs/songs/songs.dart';
import 'package:flutter_bloc_boiler_plate/models/song.dart';
import 'package:flutter_bloc_boiler_plate/repositories/songs_repository.dart';


class SongsBloc extends Bloc<SongsEvent, SongsState> {
  final SongsRepository songsRepository;

  SongsBloc({@required this.songsRepository})
      : assert(songsRepository != null),
        super(SongsLoadInProgress());

  @override
  Stream<SongsState> mapEventToState(SongsEvent event) async* {
    print(event);
    if (event is SongsLoaded) {
      yield* _mapSongsLoadedToState(event);
    }
  }

  Stream<SongsState> _mapSongsLoadedToState(SongsLoaded event) async* {
    print('what is happening');
    try {
      print('load songs');
      final songs = await this.songsRepository.loadSongs(event.hymnId);
      yield SongsLoadSuccess(
        songs.map(Song.fromEntity).toList(),
      );
      print(songs);
    } catch (e) {
      print(e.toString());
    }
  }
}
