part of 'localization.dart';

final _en = LocalizationEn();

final class LocalizationEn extends Localization {
  LocalizationEn() : super(languageCode: 'en');

  @override
  String get mail => 'mail';
}
