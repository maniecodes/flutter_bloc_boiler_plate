import 'package:flutter/material.dart';
import 'package:flutter_bloc_boiler_plate/repositories/repository.dart';
import 'package:flutter_bloc_boiler_plate/resources/web_client.dart';

class LocalStorageRepository implements HymnsRepository {
  final HymnsRepository localStorage;
  final HymnsRepository webClient;

  const LocalStorageRepository({
    @required this.localStorage,
    this.webClient = const WebClient(),
  });

  @override
  Future<List<HymnEntity>> loadHymns() async {
    try {
      return await localStorage.loadHymns();
    } catch (e) {
      final hymns = await webClient.loadHymns();
      await localStorage.saveHymns(hymns);
      return hymns;
    }
  }

  // Persists hymns to local disk and the web
  @override
  Future saveHymns(List<HymnEntity> hymns) {
    return Future.wait<dynamic>(
        [localStorage.saveHymns(hymns), webClient.saveHymns(hymns)]);
  }
}
