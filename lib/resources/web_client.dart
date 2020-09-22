import 'package:flutter_bloc_boiler_plate/repositories/repository.dart';

class WebClient implements HymnsRepository {
  final Duration delay;

  const WebClient([this.delay = const Duration(milliseconds: 3000)]);

  @override
  Future<List<HymnEntity>> loadHymns() async {
    return Future.delayed(
        delay,
        () => [
              HymnEntity('1', 'Task', 'sending', '12', 'd892398'),
              HymnEntity('2', 'Task', 'sending', '12', 'd892398'),
            ]);
  }

  /// Mock that returns true or false for success or failure. In this case,
  /// it will "Always Succeed"
  @override
  Future<bool> saveHymns(List<HymnEntity> hymns) async {
    return Future.value(true);
  }
}
