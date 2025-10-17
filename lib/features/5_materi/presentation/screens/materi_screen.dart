import 'package:flutter/material.dart';
import 'package:timetocode/features/5_materi/data/datasources/materi_local_datasource.dart';
import 'package:timetocode/features/5_materi/data/models/materi_model.dart';
import 'package:timetocode/features/5_materi/data/repositories/materi_repository_implementation.dart';
import 'package:timetocode/features/5_materi/domain/usecases/get_all_materi_usecase.dart';
import 'package:timetocode/features/5_materi/presentation/widgets/materi_card.dart';
import 'package:timetocode/features/5_materi/utils/materi_helpers.dart';
import 'package:go_router/go_router.dart';

class MateriScreen extends StatefulWidget {
  const MateriScreen({super.key});

  @override
  State<MateriScreen> createState() => _MateriScreenState();
}

class _MateriScreenState extends State<MateriScreen> {
  late Future<List<MateriModel>> futureMateri;

  @override
  void initState() {
    super.initState();
    final repo = MateriRepositoryImpl(MateriLocalDataSourceImpl());
    final usecase = GetAllMateriUseCase(repo);
    futureMateri = usecase(); // auto-load dari JSON
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Materi')),
      body: SafeArea(
        child: FutureBuilder<List<MateriModel>>(
          future: futureMateri,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('Tidak ada daftar materi'));
            }

            final materiList = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.9,
              ),
              itemCount: materiList.length,
              itemBuilder: (context, i) {
                final m = materiList[i];
                final img = MateriHelpers.firstImageUrl(m);
                final desc = MateriHelpers.firstParagraph(m) ?? '—';
                return MateriCard(
                  title: m.title,
                  thumbnailUrl: img,
                  snippet: desc,
                  onTap: () {
                    context.push(
                      '/materi/detail',
                      extra: {
                        'title': m.title,
                        'imageUrl': img ?? '',
                        'description': MateriHelpers.longDescription(m),
                        'videoUrl': MateriHelpers.firstYouTubeLink(m),
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
