import 'package:flutter/material.dart';
import 'package:flutter_bloc_boiler_plate/repositories/repository.dart';
import 'package:flutter_bloc_boiler_plate/repositories/reactive_repository.dart';
import 'package:rxdart/subjects.dart';

class ReactiveLocalStorageRepository implements ReactiveHymnsRepository {
  final HymnsRepository _repository;
  final BehaviorSubject<List<HymnEntity>> _subject;
  bool _loaded = false;

  ReactiveLocalStorageRepository({
    @required HymnsRepository repository,
    List<HymnEntity> seedValue,
  })  : _repository = repository,
        _subject = seedValue != null
            ? BehaviorSubject<List<HymnEntity>>.seeded(seedValue)
            : BehaviorSubject<List<HymnEntity>>();

  @override
  Stream<List<HymnEntity>> hymns() {
    if (!_loaded) _loadHymns();
    return _subject.stream;
  }

  void _loadHymns() {
    _loaded = true;
    _repository.loadHymns().then((entities) {
      _subject.add(List<HymnEntity>.unmodifiable(
        [if (_subject.value != null) ..._subject.value, ...entities],
      ));
    });
  }
}
