import 'package:flutter_bloc_boiler_plate/repositories/repository.dart';
import 'package:dio/dio.dart';

class HymnsApiProvider implements HymnsRepository {
  final Duration delay;
  final Dio _dio = Dio();
  final String _endpoint = "http://10.0.2.2:4000/api";

  HymnsApiProvider([this.delay = const Duration(milliseconds: 3000)]);

  @override
  Future<List<HymnEntity>> loadHymns() async {
    try {
      Response<dynamic> res = await _dio.get('$_endpoint/hymn');
      final json = res.data['data'];
      final hymns =
          (json).map<HymnEntity>((hymn) => HymnEntity.fromJson(hymn)).toList();
      return hymns;
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
    }
  }

  /// Mock that returns true or false for success or failure. In this case,
  /// it will "Always Succeed"
  @override
  Future<bool> saveHymns(List<HymnEntity> hymns) async {
    return Future.value(true);
  }
}
