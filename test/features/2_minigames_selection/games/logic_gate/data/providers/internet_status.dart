import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final internetStatusProvider =
    StreamProvider.autoDispose<InternetConnectionStatus>((ref) {
      final checker = InternetConnectionChecker.createInstance();
      return checker.onStatusChange;
    });
