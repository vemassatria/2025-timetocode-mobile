import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';

import 'package:timetocode/features/3_lessons/services/datasources/lesson_local_datasource.dart';
import 'package:timetocode/features/3_lessons/services/repositories/lesson_repository_impl.dart';
import 'package:timetocode/features/3_lessons/data/models/lesson_model.dart';
import 'package:timetocode/features/3_lessons/utils/lesson_helpers.dart';
import 'package:timetocode/features/3_lessons/presentation/widgets/lesson_list_item.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late final Future<List<LessonModel>> _futureLessons;

  @override
  void initState() {
    super.initState();
    _futureLessons = _loadLessons();
  }

  Future<List<LessonModel>> _loadLessons() async {
    final repo = LessonRepositoryImpl(const LessonLocalDataSourceImpl());
    return repo.getAllLessons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Pilih Topik Pembelajaran',
          style: AppTypography.heading6(),
        ),
        toolbarHeight: 56.h,
        backgroundColor: AppColors.surfaceDark,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.black1),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<LessonModel>>(
          future: _futureLessons,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const _LoadingState();
            }

            if (snapshot.hasError) {
              return _ErrorState(message: snapshot.error.toString());
            }

            final data = snapshot.data;
            if (data == null) {
              return const _ErrorState(message: 'Data null dari repository.');
            }

            if (data.isEmpty) {
              return const _ErrorState(
                message:
                    'Tidak menemukan lesson di assets/stories/lessons.json.\n'
                    'Periksa path asset & struktur JSON.',
              );
            }

            return _LessonListView(lessons: data);
          },
        ),
      ),
    );
  }
}

class _LessonListView extends ConsumerWidget {
  const _LessonListView({required this.lessons});

  final List<LessonModel> lessons;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 24.h),
      itemCount: lessons.length,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, i) {
        final lesson = lessons[i];

        return LessonListItem(
          title: lesson.title,
          subtitle: LessonHelpers.firstParagraph(lesson) ?? '',
          onTap: () {
            ref.read(soundEffectServiceProvider.notifier).playSelectClick();
            context.push('/lessons/detail', extra: lesson);
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Error: $message',
        style: AppTypography.small(color: AppColors.secondaryText),
        textAlign: TextAlign.center,
      ),
    );
  }
}
