import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/module_model.dart';
import '../services/module_service.dart';

final moduleServiceProvider = Provider((ref) => ModuleService());

final modulesProvider = FutureProvider<List<ModuleModel>>((ref) async {
  final moduleService = ref.read(moduleServiceProvider);
  return moduleService.loadModules();
});

// State for module selection
final selectedModuleProvider =
    StateNotifierProvider<SelectedModuleNotifier, ModuleModel?>((ref) {
      return SelectedModuleNotifier();
    });

class SelectedModuleNotifier extends StateNotifier<ModuleModel?> {
  SelectedModuleNotifier() : super(null);

  void selectModule(ModuleModel module) {
    state = module;
  }

  void clearSelection() {
    state = null;
  }
}
