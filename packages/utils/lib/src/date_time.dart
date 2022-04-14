/// 日本の曜日
const List<String> japaneseWeekdays = [
  '月',
  '火',
  '水',
  '木',
  '金',
  '土',
  '日',
];

/// 入力月の日数を返す
int lastDayOfMonth(int year, int month) => DateTime(year, month + 1, 0).day;

/// 入力日の曜日を整数型で返す
int weekDayInt(int year, int month, int day) => DateTime(year, month, day).weekday;

/// 入力日の日本の曜日を返す
String japaneseWeekDay(int year, int month, int day) =>
    japaneseWeekdays[weekDayInt(year, month, day) - 1];

/// 2 つの DateTime が同じ日かどうか判定する
bool isSameDay(DateTime a, DateTime b) => a.difference(b).inDays == 0 && a.day == b.day;
