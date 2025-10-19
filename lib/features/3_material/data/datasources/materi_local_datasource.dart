import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:timetocode/features/3_material/data/models/materi_model.dart';

abstract class MateriLocalDataSource {
  Future<MateriModel> loadOneMateriFromAssets(String path);
  Future<List<MateriModel>> loadAllMateriFromAssets(String path);
}

class MateriLocalDataSourceImpl implements MateriLocalDataSource {
  const MateriLocalDataSourceImpl();

  Map<String, dynamic> _normalizeBlock(Map<String, dynamic> raw) {
    final data = Map<String, dynamic>.from(raw['data'] as Map<String, dynamic>);
    final type = raw['type'];
    if (type != null && data['type'] == null) {
      data['type'] = type;
    }
    return {'data': data};
  }

  Map<String, dynamic> _normalizeMateriMap(Map<String, dynamic> materi) {
    final content = (materi['content'] as List)
        .cast<Map<String, dynamic>>()
        .map(_normalizeBlock)
        .toList();
    return {...materi, 'content': content};
  }

  @override
  Future<MateriModel> loadOneMateriFromAssets(String path) async {
    final jsonStr = await rootBundle.loadString(path);
    final map = json.decode(jsonStr) as Map<String, dynamic>;
    final list = (map['materi'] as List).cast<Map<String, dynamic>>();
    final normalized = _normalizeMateriMap(list.first);
    return MateriModel.fromJson(normalized);
  }

  @override
  Future<List<MateriModel>> loadAllMateriFromAssets(String path) async {
    final jsonStr = await rootBundle.loadString(path);
    final map = json.decode(jsonStr) as Map<String, dynamic>;
    final list = (map['materi'] as List).cast<Map<String, dynamic>>();
    final normalized = list.map(_normalizeMateriMap).toList();
    return normalized.map(MateriModel.fromJson).toList();
  }
}
