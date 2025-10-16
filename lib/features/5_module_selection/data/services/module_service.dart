import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/module_model.dart';

class ModuleService {
  Future<List<ModuleModel>> loadModules() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/stories/modules.json',
      );
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> modulesJson = jsonData['modules'];

      return modulesJson.map((json) => ModuleModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load modules: $e');
    }
  }
}
