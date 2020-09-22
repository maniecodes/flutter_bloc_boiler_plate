import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boiler_plate/blocs/bloc.dart';
import 'package:flutter_bloc_boiler_plate/screens/hymn_item.dart';
import 'package:flutter_bloc_boiler_plate/utils/utils.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HymnsBloc, HymnsState>(builder: (context, state) {
      if (state is HymnsLoadInProgress) {
        return CircularProgressIndicator();
      } else if (state is HymnsLoadSuccess) {
        final hymns = state.hymns;
        print('i got inside');
        print(hymns);
        return HymnList(hymnList: hymns);
      } else {
        return Container(key: ChurchKeys.hymnsEmptyContainer);
      }
    });
  }
}
