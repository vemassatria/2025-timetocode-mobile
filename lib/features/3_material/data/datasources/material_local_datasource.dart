import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:timetocode/features/3_material/data/models/material_model.dart';

abstract class MaterialLocalDataSource {
  Future<MaterialModel> loadOneMaterialFromAssets(String path);
  Future<List<MaterialModel>> loadAllMaterialFromAssets(String path);
}

class MaterialLocalDataSourceImpl implements MaterialLocalDataSource {
  const MaterialLocalDataSourceImpl();

  Map<String, dynamic> _normalizeBlock(Map<String, dynamic> raw) {
    final data = Map<String, dynamic>.from(raw['data'] as Map<String, dynamic>);
    final type = raw['type'];
    if (type != null && data['type'] == null) {
      data['type'] = type;
    }
    return {'data': data};
  }

  Map<String, dynamic> _normalizeMaterialMap(Map<String, dynamic> material) {
    final content = (material['content'] as List)
        .cast<Map<String, dynamic>>()
        .map(_normalizeBlock)
        .toList();
    return {...material, 'content': content};
  }

  @override
  Future<MaterialModel> loadOneMaterialFromAssets(String path) async {
    final jsonStr = await rootBundle.loadString(path);
    final map = json.decode(jsonStr) as Map<String, dynamic>;
    final list = (map['material'] as List).cast<Map<String, dynamic>>();
    final normalized = _normalizeMaterialMap(list.first);
    return MaterialModel.fromJson(normalized);
  }

  @override
  Future<List<MaterialModel>> loadAllMaterialFromAssets(String path) async {
    final jsonStr = await rootBundle.loadString(path);
    final map = json.decode(jsonStr) as Map<String, dynamic>;
    final list = (map['material'] as List).cast<Map<String, dynamic>>();
    final normalized = list.map(_normalizeMaterialMap).toList();
    return normalized.map(MaterialModel.fromJson).toList();
  }
}
