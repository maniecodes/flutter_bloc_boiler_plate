import 'package:flutter/material.dart';
import 'package:flutter_bloc_boiler_plate/models/hymn.dart';

class HymnList extends StatelessWidget {
  final List<Hymn> hymnList;
  const HymnList({this.hymnList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
      itemCount: hymnList.length,
      itemBuilder: (context, i) => Column(
        children: [
          InkWell(
            onTap: () {
              //make api call
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Card(
                  child: Column(
                    children: [
                      Image.asset('assets/images/hymn1.png'),
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
