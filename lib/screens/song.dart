import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boiler_plate/blocs/songs/songs_bloc.dart';
import 'package:flutter_bloc_boiler_plate/blocs/songs/songs_event.dart';
import 'package:flutter_bloc_boiler_plate/blocs/songs/songs_state.dart';
import 'package:flutter_bloc_boiler_plate/screens/song_details.dart';

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
                  itemBuilder: (context, i) => InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return SongDetails(
                                songNumber: songs[i].songNumber,
                                title: songs[i].title,
                                verses: songs[i].verses,
                                similarTunes: songs[i].similarTune,
                                alternativeTunes: songs[i].alternateTune);
                          }));
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.grey.shade400,
                                          width: 0.2,
                                        ),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: Colors.grey.shade200,
                                            offset: Offset(1, 1),
                                            blurRadius: 10,
                                            spreadRadius: 4,
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                  '${songs[i].songNumber}.'),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text('${songs[i].title}'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))
                                  ],
                                ),
                              )
                            ],
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
