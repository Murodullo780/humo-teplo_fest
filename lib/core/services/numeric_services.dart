class NumericServices {
  static String formatNumber(int number) {
    return number.toString().replaceAllMapped(
          RegExp(r'\B(?=(\d{3})+(?!\d))'),
          (match) => ' ',
        );
  }

  static int maxAmount(int number, {required int max}) {
    return number > max ? max : number;
  }
}

class DateServices {
  static String formatDateTime(DateTime dateTime) {
    String setDouble(int number) {
      return number.toString().length < 2 ? '0$number' : number.toString();
    }
    return '${setDouble(dateTime.hour)} : '
        '${setDouble(dateTime.minute)} : '
        '${setDouble(dateTime.second)}   '
        '${dateTime.year}-'
        '${setDouble(dateTime.month)}-'
        '${setDouble(dateTime.day)}';
  }
}
