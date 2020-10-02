import 'dart:async';
import 'dart:core';
import 'hymn_entity.dart';

abstract class HymnsRepository {
  /// Loads todos first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the Todos from a Web Client.
  Future<List<HymnEntity>> loadHymns();

  // Save to local storage
  Future saveHymns(List<HymnEntity> hymns);
}
