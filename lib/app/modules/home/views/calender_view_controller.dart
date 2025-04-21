//
// import 'package:get/get.dart';
//
// class CalendarViewController extends GetxController {
//   var focusedDay = DateTime(2022, 12, 1).obs;
//   var selectedDay = DateTime(2022, 12, 14).obs;
//
//   String getMonthName(DateTime date) {
//     return DateFormat('MMMM').format(date);
//   }
//
//   void updateFocusedDay(int monthOffset) {
//     focusedDay.value = DateTime(
//       focusedDay.value.year,
//       focusedDay.value.month + monthOffset,
//     );
//   }
//
//   void onDaySelected(DateTime selected, DateTime focused) {
//     selectedDay.value = selected;
//     focusedDay.value = focused;
//   }
// }