import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc_boiler_plate/repositories/repository.dart';

class FileStorage implements HymnsRepository {
  final String hymn;
  final Future<Directory> Function() getDirectory;

  const FileStorage(this.hymn, this.getDirectory);

  @override
  Future<List<HymnEntity>> loadHymns() async {
    print('load from local');
    final file = await _getLocalFile();
    final string = await file.readAsString();
    final json = JsonDecoder().convert(string);
    final hymns = (json['hymns'])
        .map<HymnEntity>((hymn) => HymnEntity.fromJson(hymn))
        .toList();
    print(hymns);
    return hymns;
  }

  @override
  Future<File> saveHymns(List<HymnEntity> hymns) async {
    print('save to file storage');
    print(hymns);
    final file = await _getLocalFile();
    return file.writeAsString(JsonEncoder().convert({
      'hymns': hymns.map((hymn) => hymn.toJson()).toList(),
    }));
  }

  Future<File> _getLocalFile() async {
    final dir = await getDirectory();
    print(dir);
    return File('${dir.path}/ChurchStorage__$hymn.json');
  }
}
