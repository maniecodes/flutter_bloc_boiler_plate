import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boiler_plate/blocs/songs/songs_bloc.dart';
import 'package:flutter_bloc_boiler_plate/models/hymn.dart';
import 'package:flutter_bloc_boiler_plate/screens/song.dart';
import 'package:flutter_bloc_boiler_plate/utils/utils.dart';

class HymnList extends StatelessWidget {
  final List<Hymn> hymnList;
  const HymnList({this.hymnList});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print('hymnlist');
    print(hymnList);
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
      itemCount: hymnList.length,
      itemBuilder: (context, i) => Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            height: 245,
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 24,
                      top: 24,
                      right: size.width * .35,
                    ),
                    height: 230,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFEAEAEA).withOpacity(.75),
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Text(
                            "New York Time Best For 11th March 2020",
                            style: TextStyle(
                              fontSize: 9,
                            ),
                          ),
                        ),
                        Text(
                          "${hymnList[i].title}",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          "${hymnList[i].totalNumOfSongs} Hymns",
                          style: TextStyle(
                            color: AppTheme.getTheme().primaryColorDark,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10.0),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(3, 7),
                                        blurRadius: 20,
                                        color: Color(0xFD3D3D3).withOpacity(.5),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Icon(
                                        Icons.star,
                                        color: AppTheme.getTheme().hintColor,
                                        size: 15,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "5.0",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "${hymnList[i].description}",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: AppTheme.getTheme().primaryColorDark,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Image.asset(
                    "assets/images/book-2.png",
                    width: size.width * .37,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: SizedBox(
                      height: 40,
                      width: size.width * .3,
                      child: GestureDetector(
                        onTap: () {
                          print('clicked');
                          print(hymnList[i]);
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return BlocProvider.value(
                              value: BlocProvider.of<SongsBloc>(context),
                              child: SongScreen(hymnId: hymnList[i].hymnId),
                            );
                          }));

                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (_) => Song(hymnId: hymnList[i].id)));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: AppTheme.getTheme().secondaryHeaderColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              bottomRight: Radius.circular(24),
                            ),
                          ),
                          child: Text(
                            "Open",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
