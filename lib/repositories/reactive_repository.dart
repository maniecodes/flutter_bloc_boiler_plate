import 'dart:async';
import 'dart:core';
import 'hymn_entity.dart';

abstract class ReactiveHymnsRepository {
  
  Stream<List<HymnEntity>> hymns();
}
