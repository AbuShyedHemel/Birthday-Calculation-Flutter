import 'package:age/age.dart';

class AgeCalculation{

  calculateAge(DateTime today, DateTime birthday){
    AgeDuration age;
    age = Age.dateDifference(fromDate: birthday, toDate: today,includeToDate: false);
    return age;
  }

  AgeDuration nextBirthday(DateTime today, DateTime birthday){
    DateTime temp = DateTime(today.year,birthday.month,birthday.day);
    DateTime nextBirthdayData = temp.isBefore(today)?Age.add(date: temp, duration: AgeDuration(years: 1)):temp;
    AgeDuration nextBirthdayDuration = Age.dateDifference(fromDate: today, toDate: nextBirthdayData);
    return nextBirthdayDuration;
  }

  nextBirthdayWeekDay(DateTime today, DateTime birthday){
    DateTime temp = DateTime(today.year,birthday.month,birthday.day);
    DateTime nextBirthdayData = temp.isBefore(today)?Age.
    add(date: temp, duration: AgeDuration(years: 1)):temp;

    return nextBirthdayData.weekday;
  }
}