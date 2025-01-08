import '../../../di/main_di.dart';
import '../../helper/date_time_helper.dart';

extension DateTimeExtension on DateTime {
  String formatDateTime(String formatter) {
    return locator<DateTimeHelper>().formatDateTime(
      dateTime: this,
      formatter: formatter.toString(),
    );
  }

  String agoDateTime() {
    return locator<DateTimeHelper>().agoDateTime(
      dateTime: this,
    );
  }
}

extension IntDateTimeCoveter on int {
  DateTime toDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(this);
  }
}
