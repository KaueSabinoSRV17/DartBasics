import 'dart:async';

updateTimeOnScreen(Timer t) {
  
  DateTime dateTimeOfLastWorkingDay = DateTime.parse('2022-12-02 18:00:00.000');
  DateTime dateTimeOfExactlyNow = DateTime.now();
  
  Duration diferenceBetweenDates = dateTimeOfLastWorkingDay.difference(dateTimeOfExactlyNow);
  
  var daysLeft = diferenceBetweenDates.inDays;
  var hoursLeft = diferenceBetweenDates.inHours % 24;
  var minutesLeft = diferenceBetweenDates.inMinutes % 60;
  var secondsLeft = diferenceBetweenDates.inSeconds % 60;
  
  var timeUnits = [daysLeft, hoursLeft, minutesLeft, secondsLeft];
  
  String padUnitWithZeroIfLessThanTen(String timerMessage, String currentUnit) {
    bool mustPadWithZero = currentUnit.length < 2;
    
    if (mustPadWithZero) {
      currentUnit = '0$currentUnit'; 
    }
    
    return '$timerMessage:$currentUnit';  
  }
  
  String timerMessage = 
    timeUnits
      .map((unit) => unit.toString())
      .reduce(padUnitWithZeroIfLessThanTen);
  
  print(timerMessage);
}

main() => Timer.periodic(const Duration(seconds: 1), updateTimeOnScreen);
