import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boiler_plate/blocs/songs/songs_bloc.dart';
import 'package:flutter_bloc_boiler_plate/blocs/songs/songs_event.dart';
import 'package:flutter_bloc_boiler_plate/blocs/songs/songs_state.dart';
import 'package:flutter_bloc_boiler_plate/utils/utils.dart';

// ignore: must_be_immutable
class SongScreen extends StatelessWidget {
  final int hymnId;
  SongsBloc songsBloc;
  SongScreen({Key key, @required this.hymnId, this.songsBloc})
      : assert(hymnId != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    songsBloc = BlocProvider.of<SongsBloc>(context)..add(SongsLoaded(hymnId));
    print(hymnId);
    print(songsBloc);
    print('songs');
    return BlocBuilder<SongsBloc, SongsState>(builder: (context, state) {
      print(state);
      if (state is SongsLoadInProgress) {
        return CircularProgressIndicator();
      } else if (state is SongsLoadSuccess) {
        final songs = state.songs;
        print('the songs are');
        print(songs);
        return Scaffold(
            appBar: AppBar(
              title: Text('English Hymn'),
            ),
            body: Container(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, i) => Card(
                        elevation: 2.0,
                        margin: EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 3.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blueAccent[100]),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5.0),
                            leading: Container(
                              child: Text('${i + 1}.'),
                            ),
                            title: Text('${songs[i].title}'),
                          ),
                        ),
                      ),
                  itemCount: songs.length),
            ));
      } else {
        return Container();
      }
    });
  }
}
