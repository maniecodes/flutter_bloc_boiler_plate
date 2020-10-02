import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boiler_plate/blocs/songs/songs_bloc.dart';
import 'package:flutter_bloc_boiler_plate/models/hymn.dart';
import 'package:flutter_bloc_boiler_plate/screens/song.dart';

class HymnList extends StatelessWidget {
  final List<Hymn> hymnList;
  const HymnList({this.hymnList});

  @override
  Widget build(BuildContext context) {
    print('hymnlist');
    print(hymnList);
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
      itemCount: hymnList.length,
      itemBuilder: (context, i) => Column(
        children: [
          InkWell(
            onTap: () {
              print('clicked');
              print(hymnList[i]);
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return BlocProvider.value(
                  value: BlocProvider.of<SongsBloc>(context),
                  child: SongScreen(hymnId: hymnList[i].hymnId),
                );
              }));

              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (_) => Song(hymnId: hymnList[i].id)));
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 320,
                child: Card(
                  child: Column(
                    children: [
                      Image.asset('assets/images/hymn1.png'),
                      Text('${hymnList[i].id}'),
                      Text('${hymnList[i].title}'),
                      Text('${hymnList[i].totalNumOfSongs}')
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
