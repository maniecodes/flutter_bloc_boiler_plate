import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boiler_plate/blocs/hymns/hymns_event.dart';
import 'package:flutter_bloc_boiler_plate/blocs/hymns/hymns_state.dart';
import 'package:flutter_bloc_boiler_plate/models/hymn.dart';
import 'package:flutter_bloc_boiler_plate/repositories/hymns_repository.dart';

class HymnsBloc extends Bloc<HymnsEvent, HymnsState> {
  final HymnsRepository hymnsRepository;

  HymnsBloc({@required this.hymnsRepository})
      : assert(hymnsRepository != null),
        super(null);

  HymnsState get initialState => HymnsLoadInProgress();

  @override
  Stream<HymnsState> mapEventToState(HymnsEvent event) async* {
    if (event is HymnsLoaded) {
      yield* _mapHymnsLoadedToState();
    }
  }

  Stream<HymnsState> _mapHymnsLoadedToState() async* {
    try {
      print('loading hymns');
      final hymns = await this.hymnsRepository.loadHymns();
      print(hymns);
      yield HymnsLoadSuccess(
        hymns.map(Hymn.fromEntity).toList(),
      );
    } catch (e) {
      print(e.toString());
      yield HymnsLoadFailure();
    }
  }
}
