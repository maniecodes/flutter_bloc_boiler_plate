import 'package:flutter/material.dart';

class SongDetails extends StatelessWidget {
  final List verses;
  final String songNumber;
  final String title;
  final List similarTunes;
  final List alternativeTunes;
  SongDetails(
      {Key key,
      @required this.songNumber,
      @required this.title,
      @required this.verses,
      this.similarTunes,
      this.alternativeTunes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text('$songNumber. $title'),
            ],
          ),
        ),
        body: Container(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Text('$songNumber'),
                  ),
                  Text('$title'),
                ],
              ),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Container(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Column(
                            children: [
                              Text("${i + 1}."),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Column(
                            children: [
                              Text("${verses[i]['verse']}"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: verses.length,
            )
          ],
        )));
  }
}
