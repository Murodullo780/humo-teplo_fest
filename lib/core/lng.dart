import 'package:flutter/material.dart';

import 'enums.dart';

Lng locale = Lng.uz;

extension LngExtension on String {
  String tr() {
    switch (locale) {
      case Lng.uz:
        return Translation.uz[this] ?? this;
      case Lng.en:
        return Translation.en[this] ?? this;
      case Lng.ru:
        return Translation.ru[this] ?? this;
    }
  }
}

class Translation {
  static const Map<String, String> uz = {
    TranslationKeys.continuee: 'Davom eting',
    TranslationKeys.receivePrizes: 'Sovrinlarni olish',
    TranslationKeys.total: 'Jami',
    TranslationKeys.registrationDate: "Ro'yxatdan o'tish sanasi",
    TranslationKeys.receiptNumber: "Kvitansiya raqami",
    TranslationKeys.cashier: 'Kassir',
    TranslationKeys.products: 'Mahsulotlar',
    TranslationKeys.takePhotoAndPresent:
        "Kvitansiyani suratga oling va fotosuratni sovrinlarni tarqatish stendida taqdim eting",
    TranslationKeys.returnToMain: "Bosh sahifaga qaytish",
    TranslationKeys.receipt: "Chek",
  };

  static const Map<String, String> en = {
    TranslationKeys.continuee: 'Continue',
    TranslationKeys.receivePrizes: 'Receive prizes',
    TranslationKeys.total: 'Total',
    TranslationKeys.registrationDate: 'Registration date',
    TranslationKeys.receiptNumber: 'Receipt number',
    TranslationKeys.cashier: 'Cashier',
    TranslationKeys.products: 'Products',
    TranslationKeys.takePhotoAndPresent:
        'Take a photo of the receipt and present the photo at the prize distribution stand',
    TranslationKeys.returnToMain: 'Return to the main page',
    TranslationKeys.receipt: 'Receipt',
  };

  static const Map<String, String> ru = {
    TranslationKeys.continuee: 'Продолжить',
    TranslationKeys.receivePrizes: 'Получить призы',
    TranslationKeys.total: 'Итого',
    TranslationKeys.registrationDate: 'Дата регистрации',
    TranslationKeys.receiptNumber: 'Номер чека',
    TranslationKeys.cashier: 'Кассир',
    TranslationKeys.products: 'Товары',
    TranslationKeys.takePhotoAndPresent: 'Сфотографируйте чек и предъявите фото на стенде выдачи призов',
    TranslationKeys.returnToMain: 'Вернутся на главную',
    TranslationKeys.receipt: 'Чек',
  };
}

class TranslationKeys {
  static const String continuee = 'continue';
  static const String receivePrizes = 'receivePrizes';
  static const String total = 'total';
  static const String registrationDate = 'registrationDate';
  static const String receiptNumber = 'receiptNumber';
  static const String cashier = 'cashier';
  static const String products = 'products';
  static const String takePhotoAndPresent = 'takePhotoAndPresent';
  static const String returnToMain = 'returnToMain';
  static const String receipt = 'receipt';
}
