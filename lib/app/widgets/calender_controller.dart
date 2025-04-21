import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalenderController extends GetxController {
  // Reactive variables for focused and selected days
  var focusedDay = DateTime(2022, 12, 1).obs;
  var selectedDay = DateTime(2022, 12, 14).obs;

  // Helper method to get the month name from a DateTime
  String getMonthName(DateTime date) {
    return DateFormat('MMMM').format(date);
  }

  // Method to navigate to the previous month
  void previousMonth() {
    focusedDay.value = DateTime(
      focusedDay.value.year,
      focusedDay.value.month - 1,
    );
  }

  // Method to navigate to the next month
  void nextMonth() {
    focusedDay.value = DateTime(
      focusedDay.value.year,
      focusedDay.value.month + 1,
    );
  }

  // Method to handle day selection
  void onDaySelected(DateTime selected, DateTime focused) {
    selectedDay.value = selected;
    focusedDay.value = focused;
  }

  // Helper method to check if two dates are the same day
  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}