import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timetocode/features/5_materi/data/datasources/materi_local_datasource.dart';
import 'package:timetocode/features/5_materi/data/models/materi_model.dart';
import 'package:timetocode/features/5_materi/data/repositories/materi_repository_implementation.dart';
import 'package:timetocode/features/5_materi/domain/usecases/get_all_materi_usecase.dart';
import 'package:timetocode/features/5_materi/presentation/widgets/materi_list_item.dart';
import 'package:timetocode/features/5_materi/utils/materi_helpers.dart';

class MateriScreen extends StatefulWidget {
  const MateriScreen({super.key});

  @override
  State<MateriScreen> createState() => _MateriScreenState();
}

class _MateriScreenState extends State<MateriScreen> {
  late final Future<List<MateriModel>> _futureMateri;

  // palet yang mirip figma (navy, kartu gelap, aksen biru & hijau)
  static const _bgNavy = Color(0xFF131C33);
  static const _cardDark = Color(0xFF212C46);
  static const _cardStroke = Color(0x33121A30); // 20% opacity
  static const _titleColor = Colors.white;
  static const _subtitleColor = Color(0xFFB8C2D8);
  static const _accentBlue = Color(0xFF66A6FF);
  static const _accentGreen = Color(0xFF4CD964);

  @override
  void initState() {
    super.initState();
    final repo = MateriRepositoryImpl(MateriLocalDataSourceImpl());
    _futureMateri = GetAllMateriUseCase(repo)();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgNavy,
      appBar: AppBar(
        backgroundColor: _bgNavy,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Pilih Topik Pembelajaran',
          style: TextStyle(color: _titleColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<MateriModel>>(
          future: _futureMateri,
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snap.hasError) {
              return Center(
                child: Text(
                  'Error: ${snap.error}',
                  style: const TextStyle(color: _subtitleColor),
                ),
              );
            }
            final list = snap.data ?? const <MateriModel>[];
            if (list.isEmpty) {
              return const Center(
                child: Text(
                  'Tidak ada materi',
                  style: TextStyle(color: _subtitleColor),
                ),
              );
            }

            return ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              itemCount: list.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, i) {
                final m = list[i];

                const completed = false;
                const enabled = true;

                return MateriListItem(
                  title: m.title,
                  subtitle: MateriHelpers.firstParagraph(m) ?? '',
                  completed: completed,
                  enabled: enabled,
                  background: _cardDark,
                  borderColor: _cardStroke,
                  titleColor: _titleColor,
                  subtitleColor: _subtitleColor,
                  accentBlue: _accentBlue,
                  accentGreen: _accentGreen,
                  onTap: () => context.push('/materi/detail', extra: m),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
