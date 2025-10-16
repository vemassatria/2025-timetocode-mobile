import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import '../../data/providers/selected_module_provider.dart';
import '../widgets/module_card.dart';

class ModuleSelectionScreen extends ConsumerWidget {
  const ModuleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modulesAsync = ref.watch(modulesProvider);

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Text(
                'Pilih Modul Pembelajaran',
                style: AppTypography.heading4(color: AppColors.primaryText),
              ),
              SizedBox(height: 8.h),
              Text(
                'memulai kapasitas modul',
                style: AppTypography.small(color: AppColors.secondaryText),
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: modulesAsync.when(
                  data: (modules) => ListView.builder(
                    itemCount: modules.length,
                    itemBuilder: (context, index) {
                      final module = modules[index];
                      return ModuleCard(
                        title: module.title,
                        description: module.description,
                        isCompleted: module.isCompleted,
                        onTap: () {
                          print(
                            'Attempting navigation to module: ${module.id}',
                          ); // Debug print
                          ref
                              .read(selectedModuleProvider.notifier)
                              .selectModule(module);
                          context.push('/modules/${module.id}');
                        },
                      );
                    },
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stack) => Center(child: Text('Error: $error')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
