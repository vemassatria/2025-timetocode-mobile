import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:timetocode/features/3_lessons/data/models/lesson_model.dart';
import 'package:timetocode/features/3_lessons/services/datasources/lesson_local_datasource.dart';
import 'package:timetocode/features/3_lessons/services/repositories/lesson_repository_impl.dart';

class MockLessonLocalDataSource extends Mock implements LessonLocalDataSource {}

void main() {
  late LessonRepositoryImpl repository;
  late MockLessonLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockLessonLocalDataSource();
    repository = LessonRepositoryImpl(mockLocalDataSource);
  });

  group('LessonRepositoryImpl', () {
    final lessonList = [
      const LessonModel(level: 1, title: 'Intro Dart', content: []),
      const LessonModel(level: 2, title: 'Flutter Basics', content: []),
    ];

    test('getAllLessons() returns all lessons', () async {
      when(() => mockLocalDataSource.getAll()).thenAnswer((_) async => lessonList);
      final result = await repository.getAllLessons();
      expect(result, equals(lessonList));
      verify(() => mockLocalDataSource.getAll()).called(1);
    });

    test('getLesson() returns lesson by level if found', () async {
      when(() => mockLocalDataSource.getAll()).thenAnswer((_) async => lessonList);
      final result = await repository.getLesson(2);
      expect(result, isNotNull);
      expect(result!.title, 'Flutter Basics');
    });

    test('getLesson() returns null if not found (StateError)', () async {
      when(() => mockLocalDataSource.getAll()).thenAnswer((_) async => lessonList);
      final result = await repository.getLesson(999);
      expect(result, isNull);
    });

    test('getLesson() returns null when DataSource throws Exception', () async {
      when(() => mockLocalDataSource.getAll()).thenThrow(Exception('Database Corrupt'));
      
      final result = await repository.getLesson(1);
      
      expect(result, isNull);
      verify(() => mockLocalDataSource.getAll()).called(1);
    });
  });
}