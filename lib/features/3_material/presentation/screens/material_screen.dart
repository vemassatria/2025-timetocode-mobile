import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/features/3_material/data/datasources/material_local_datasource.dart';
import 'package:timetocode/features/3_material/data/models/material_model.dart';
import 'package:timetocode/features/3_material/data/repositories/material_repository_implementation.dart';
import 'package:timetocode/features/3_material/domain/usecases/get_all_material_usecase.dart';
import 'package:timetocode/features/3_material/presentation/widgets/material_card.dart';
import 'package:timetocode/features/3_material/utils/material_helpers.dart';

class MaterialScreen extends StatefulWidget {
  const MaterialScreen({super.key});

  @override
  State<MaterialScreen> createState() => _MateriScreenState();
}

class _MateriScreenState extends State<MaterialScreen> {
  late final Future<List<MaterialModel>> _futureMateri;

  @override
  void initState() {
    super.initState();
    _futureMateri = _loadMateri();
  }

  Future<List<MaterialModel>> _loadMateri() async {
    final repo = MaterialRepositoryImpl(const MaterialLocalDataSourceImpl());
    final usecase = GetAllMaterialUseCase(repo);
    return usecase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Materi Pembelajaran', style: AppTypography.heading6()),
        toolbarHeight: 56.h,
        backgroundColor: AppColors.surfaceDark,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.black1),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<MaterialModel>>(
          future: _futureMateri,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const _LoadingState();
            }

            if (snapshot.hasError) {
              return _ErrorState(message: snapshot.error.toString());
            }

            final materiList = snapshot.data ?? [];

            if (materiList.isEmpty) {
              return const _EmptyState();
            }

            return _MateriListView(materiList: materiList);
          },
        ),
      ),
    );
  }
}

class _MateriListView extends ConsumerWidget {
  const _MateriListView({required this.materiList});

  final List<MaterialModel> materiList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 24.h),
      itemCount: materiList.length,
      separatorBuilder: (_, _) => SizedBox(height: 16.h),
      itemBuilder: (_, i) {
        final materi = materiList[i];
        const isCompleted = true;

        return MaterialCard(
          title: materi.title,
          subtitle: MaterialHelpers.firstParagraph(materi) ?? '',
          isCompleted: isCompleted,
          onTap: () {
            ref.read(soundEffectServiceProvider.notifier).playSelectClick();
            context.push('/material/detail', extra: materi);
          },
        );
      },
    );
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message});
  final String message;

  static const _subtitleColor = Color(0xFFB8C2D8);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Error: $message',
        style: const TextStyle(color: _subtitleColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  static const _subtitleColor = Color(0xFFB8C2D8);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tidak ada materi', style: TextStyle(color: _subtitleColor)),
    );
  }
}
