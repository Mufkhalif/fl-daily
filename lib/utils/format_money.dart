import 'package:intl/intl.dart';

final oCcy = NumberFormat("#,##0", "en_US");

String formatMoney(int price) {
  return oCcy.format(price);
}
