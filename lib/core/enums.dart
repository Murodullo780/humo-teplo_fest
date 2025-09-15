enum Lng { uz, ru, en }

extension LngExtension on Lng {
  String get shortName {
    switch (this) {
      case Lng.uz:
        return 'uz';
      case Lng.ru:
        return 'ru';
      case Lng.en:
        return 'en';
    }
  }

  String get fullName {
    switch (this) {
      case Lng.uz:
        return 'O`zbekcha';
      case Lng.ru:
        return 'Русский';
      case Lng.en:
        return 'English';
    }
  }
}
