import 'package:intl/intl.dart';

class DateModel {
  DateTime dateTime;
  DateModel(
    this.dateTime,
  );

  String getFormattedDayName() {
    final dateFormat = DateFormat("EEE");
    return dateFormat.format(
      dateTime,
    );
  }

  String getFormatedDayNumber() {
    final dateFormat = DateFormat('d');
    return dateFormat.format(dateTime);
  }
}
