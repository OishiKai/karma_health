import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/app_locale.dart';

part 'localization.g.dart';
part 'localization_en.dart';
part 'localization_ja.dart';

@riverpod
Localization localization(LocalizationRef ref) {
  final appLocale = ref.watch(appLocaleProvider);
  return switch (appLocale.languageCode) {
    'en' => _en,
    'ja' => _ja,
    _ => _en,
  };
}

abstract base class Localization {
  Localization({
    required this.languageCode,
  });

  final String languageCode;

  late final dateFormatter = DateFormatter(
    languageCode: languageCode,
  );

  String get mail;
}

class DateFormatter {
  DateFormatter({
    required this.languageCode,
  });

  final String languageCode;

  late final yMMEd = DateFormat.yMMMEd(languageCode);
}
