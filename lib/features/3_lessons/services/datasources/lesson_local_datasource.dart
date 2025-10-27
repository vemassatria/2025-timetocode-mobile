import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:timetocode/features/3_lessons/data/models/lesson_model.dart';

abstract class LessonLocalDataSource {
  Future<List<LessonModel>> getAll();
}

class LessonLocalDataSourceImpl implements LessonLocalDataSource {
  const LessonLocalDataSourceImpl();

  @override
  Future<List<LessonModel>> getAll() async {
    final raw = await rootBundle.loadString('assets/stories/lessons.json');
    final decoded = json.decode(raw);

    final list = _extractLessonArray(decoded);

    if (list == null || list.isEmpty) {
      final keys = decoded is Map ? decoded.keys.join(', ') : '(bukan Map)';
      throw FormatException(
        'Array lesson tidak ditemukan atau kosong. '
        'Cek key "lessons"/"materi" & isi datanya. '
        'Top-level keys: $keys',
      );
    }

    final out = <LessonModel>[];
    final errs = <String>[];

    for (var i = 0; i < list.length; i++) {
      final it = list[i];
      if (it is! Map<String, dynamic>) {
        errs.add('[$i] bukan object JSON');
        continue;
      }
      try {
        final normalized = _normalizeLessonJson(it);
        out.add(LessonModel.fromJson(normalized));
      } catch (e, st) {
        errs.add('[$i] $e');
        debugPrint('Lesson parse error [$i]: $e\n$st');
      }
    }

    if (out.isEmpty) {
      throw FormatException(
        'Gagal memuat lessons: semua item gagal diparse. '
        'Cek enum headingType & struktur blok. Detail: ${errs.take(3).join(" | ")}',
      );
    }
    return out;
  }

  // ------------ Helpers ------------

  // Cari array calon "lessons" di berbagai kemungkinan struktur
  List<dynamic>? _extractLessonArray(dynamic decoded) {
    if (decoded is List) return decoded;

    if (decoded is Map) {
      // Kandidat nama yang umum
      const candidates = [
        'lessons',
        'materi',
        'lesson',
        'materials',
        'data',
        'items',
      ];
      for (final k in candidates) {
        final v = decoded[k];
        if (v is List) return v;
      }

      // Scan semua nilai: ambil List yang elemennya Map dan punya minimal title+content
      for (final v in decoded.values) {
        if (v is List && v.isNotEmpty && v.first is Map) {
          final m = (v.first as Map);
          final hasTitle = m.containsKey('title');
          final hasContent = m.containsKey('content');
          if (hasTitle && hasContent) return v;
        }
      }
    }
    return null;
  }

  Map<String, dynamic> _normalizeLessonJson(Map<String, dynamic> src) {
    final contentList =
        (src['content'] as List?)
            ?.whereType<Map<String, dynamic>>()
            .map(_normalizeBlockJson)
            .toList() ??
        const <Map<String, dynamic>>[];

    return <String, dynamic>{
      'level': src['level'] ?? 0,
      'title': (src['title'] ?? '').toString(),
      'videoUrl': (src['videoUrl'] ?? '') as String?,
      'content': contentList,
    };
  }

  Map<String, dynamic> _normalizeBlockJson(Map<String, dynamic> src) {
    final type = (src['type'] ?? '').toString();
    final data =
        (src['data'] as Map?)?.cast<String, dynamic>() ?? <String, dynamic>{};

    switch (type) {
      case 'heading':
        final raw = (data['headingType'] ?? '').toString().trim().toLowerCase();
        data['headingType'] = switch (raw) {
          'maintitle' => 'mainTitle',
          'topictitle' => 'topicTitle',
          'subtopictitle' => 'subTopicTitle',
          'h1' => 'mainTitle',
          'h2' || 'h3' || 'h4' => 'topicTitle',
          'h5' || 'h6' => 'subTopicTitle',
          _ => 'topicTitle',
        };
        data['text'] = (data['text'] ?? '').toString();
        break;

      case 'list':
        data['head'] = (data['head'] ?? '').toString();
        final lt = (data['listType'] ?? 'unordered').toString().toLowerCase();
        data['listType'] = (lt == 'ordered') ? 'ordered' : 'unordered';
        final items = (data['items'] as List?) ?? const [];
        data['items'] = items.map((e) => e.toString()).toList();
        break;

      case 'table':
        final headers = data['headers'];
        if (headers is List && headers.isNotEmpty && headers.first is List) {
          data['headers'] = (headers.first as List)
              .map((e) => e.toString())
              .toList();
        } else if (headers is List) {
          data['headers'] = headers.map((e) => e.toString()).toList();
        } else {
          data['headers'] = <String>[];
        }

        final rows = data['rows'];
        if (rows is List) {
          data['rows'] = rows
              .map(
                (r) => (r is List)
                    ? r.map((e) => e.toString()).toList()
                    : <String>[],
              )
              .toList();
        } else {
          data['rows'] = <List<String>>[];
        }
        break;

      case 'image':
        data['url'] = (data['url'] ?? '').toString();
        data['caption'] = (data['caption'] ?? '') as String?;
        break;

      case 'text':
        data['text'] = (data['text'] ?? '').toString();
        break;

      default:
        return <String, dynamic>{
          'type': 'text',
          'data': {'text': ''},
        };
    }

    return <String, dynamic>{'type': type, 'data': data};
  }
}
