/// 桁区切り
import 'package:intl/intl.dart';

class DigitSeparator {
  String addSeparatorToNum({required int num}) {
    final formatter = NumberFormat('#,###');
    final numWithSeparator = formatter.format(num);
    return numWithSeparator;
  }
}
