import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
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
      LessonModel(level: 1, title: 'Intro Dart', content: []),
      LessonModel(level: 2, title: 'Flutter Basics', content: []),
    ];

    test('getAllLessons() returns all lessons', () async {
      // arrange
      when(mockLocalDataSource.getAll()).thenAnswer((_) async => lessonList);

      // act
      final result = await repository.getAllLessons();

      // assert
      expect(result, lessonList);
      verify(mockLocalDataSource.getAll()).called(1);
    });

    test('getLesson() returns lesson by level if found', () async {
      // arrange
      when(mockLocalDataSource.getAll()).thenAnswer((_) async => lessonList);

      // act
      final result = await repository.getLesson(2);

      // assert
      expect(result?.title, 'Flutter Basics');
    });

    test('getLesson() returns null if not found', () async {
      // arrange
      when(mockLocalDataSource.getAll()).thenAnswer((_) async => lessonList);

      // act
      final result = await repository.getLesson(999);

      // assert
      expect(result, isNull);
    });
  });
}
