import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boiler_plate/blocs/bloc.dart';
import 'package:flutter_bloc_boiler_plate/screens/hymn_item.dart';
import 'package:flutter_bloc_boiler_plate/utils/utils.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HymnsBloc, HymnsState>(builder: (context, state) {
      print(state);
      print('state');
      if (state is HymnsLoadInProgress) {
        return CircularProgressIndicator();
      } else if (state is HymnsLoadSuccess) {
        final hymns = state.hymns;
        print('i got inside');
        print(hymns);
        // return
        return SingleChildScrollView(
          
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      style: Theme.of(context).textTheme.headline4,
                      children: [
                        TextSpan(text: "List of "),
                        TextSpan(
                          text: "hymns",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ]),
                ),
                HymnList(hymnList: hymns),
              ],
            ),
          ),
        );
      } else {
        return Container(key: ChurchKeys.hymnsEmptyContainer);
      }
    });
  }
}
