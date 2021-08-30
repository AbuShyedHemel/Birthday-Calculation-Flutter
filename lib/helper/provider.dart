import 'package:flutter/material.dart';

class ProviderHelper with ChangeNotifier{
  DateTime todayDate = DateTime.now();
  DateTime dob = DateTime(1996, 06, 09);
  
  //TextEditingController dobcontroller = AgeCalculation().dobcontroller;
  Future<Null> selectTodayDate(BuildContext context) async{
    final DateTime picked = await showDatePicker(
      context: context, 
      initialDate: todayDate, 
      firstDate: dob, 
      lastDate: DateTime(2101));
      if(picked!=null && picked!=todayDate){
          todayDate = picked;
      }
      notifyListeners();
  }
  Future<Null> selectDOBDate(BuildContext context) async{
    final DateTime picked = await showDatePicker(
      context: context, 
      initialDate: todayDate, 
      firstDate: DateTime(1900), 
      lastDate: todayDate);
      if(picked!=null && picked!=todayDate){
          dob = picked;
      }
      notifyListeners();
  }

}