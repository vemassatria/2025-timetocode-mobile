import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/module_model.dart';

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

// State for module loading
final moduleLoadingProvider = StateProvider<bool>((ref) => false);

// State for module error handling
final moduleErrorProvider = StateProvider<String?>((ref) => null);

// Provider for list of available modules
final modulesProvider =
    StateNotifierProvider<ModulesNotifier, List<ModuleModel>>((ref) {
      return ModulesNotifier();
    });

class ModulesNotifier extends StateNotifier<List<ModuleModel>> {
  ModulesNotifier()
    : super([
        const ModuleModel(
          id: '1',
          title: 'If, Else, Switch',
          description: 'Pelajari penggunaan untuk pembuatan logika bercabang',
          isCompleted: true,
        ),
        const ModuleModel(
          id: '2',
          title: 'For, While, Do-while',
          description: 'Pelajari penggunaan untuk pembuatan logika berulang',
          isCompleted: false,
        ),
        const ModuleModel(
          id: '3',
          title: 'Array dan String',
          description: 'Pelajari penggunaan untuk data skalar dan array',
          isCompleted: false,
        ),
      ]);

  Future<void> fetchModules() async {
    try {
      // TODO: Implement actual API call or data fetching
      // For now using mock data

      // You can add actual API integration here
      // final response = await apiService.getModules();
      // state = response.map((data) => ModuleModel.fromJson(data)).toList();
    } catch (e) {
      // Handle error
      throw Exception('Failed to fetch modules: $e');
    }
  }

  void markModuleAsComplete(String moduleId) {
    state = state.map((module) {
      if (module.id == moduleId) {
        return module.copyWith(isCompleted: true);
      }
      return module;
    }).toList();
  }

  void updateModule(ModuleModel updatedModule) {
    state = state.map((module) {
      if (module.id == updatedModule.id) {
        return updatedModule;
      }
      return module;
    }).toList();
  }
}

// Provider for filtered/sorted modules
final sortedModulesProvider = Provider<List<ModuleModel>>((ref) {
  final modules = ref.watch(modulesProvider);
  final sortedModules = [...modules];
  sortedModules.sort((a, b) {
    if (a.isCompleted == b.isCompleted) {
      return a.title.compareTo(b.title);
    }
    return a.isCompleted ? -1 : 1;
  });
  return sortedModules;
});

// Provider for module progress
final moduleProgressProvider = Provider<double>((ref) {
  final modules = ref.watch(modulesProvider);
  if (modules.isEmpty) return 0.0;

  final completedModules = modules.where((module) => module.isCompleted).length;
  return completedModules / modules.length;
});
