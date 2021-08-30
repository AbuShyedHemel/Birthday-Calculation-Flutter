import 'package:age_calculator/helper/provider.dart';
import 'package:age_calculator/services/agecalculation.dart';
import 'package:flutter/material.dart';
import 'package:age/age.dart';
import 'package:provider/provider.dart';

class Midle extends StatefulWidget {

  @override
  _MidleState createState() => _MidleState();
}

class _MidleState extends State<Midle> {
 
  DateTime todayDate = DateTime.now();
  
  AgeDuration _ageDuration;
  AgeDuration _nextBirthday;
  int _nextbdayWeekDay;

  List<String> _weeks = [
    "weeks",
    "MONDAY",
    "TUESDAY",
    "WEDNESDAY",
    "THRUSDAY",
    "FRIDAY",
    "SATURDAY",
    "SUNDAY"
  ];

  void dateCalculate(){
    setState(() {
    final providerHelp = Provider.of<ProviderHelper>(context, listen: false);
    _ageDuration = AgeCalculation().calculateAge(providerHelp.todayDate, providerHelp.dob);
    _nextBirthday = AgeCalculation().nextBirthday(providerHelp.todayDate, providerHelp.dob);
    _nextbdayWeekDay = AgeCalculation().nextBirthdayWeekDay(providerHelp.todayDate, providerHelp.dob);
    });
  }

  @override
  Widget build(BuildContext context) {
    final providerHelp = Provider.of<ProviderHelper>(context, listen: false);
        _ageDuration = AgeCalculation().calculateAge(providerHelp.todayDate, providerHelp.dob);
    _nextBirthday = AgeCalculation().nextBirthday(providerHelp.todayDate, providerHelp.dob);
    _nextbdayWeekDay = AgeCalculation().nextBirthdayWeekDay(providerHelp.todayDate, providerHelp.dob);
    return Container(
              margin: EdgeInsets.symmetric(
                vertical: 40
              ),
              width: double.maxFinite,
              //height: 400,
              decoration: BoxDecoration(
                color: Color(0xff333333),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 200,
                        padding: EdgeInsets.symmetric(
                          vertical: 29
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("AGE",style: TextStyle
                            (
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700
                            ),),
                            Row(
                              children: [
                                Consumer<ProviderHelper>(builder: (_,data,__){
                                  //print(data.ageDuration.years);
                                  return Text("${_ageDuration.years} ",
                                  style: TextStyle(color: Color(0xffCDDC39),fontSize: 76,fontWeight: FontWeight.w700),);
                                  
                                  }
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 13),
                                  child: Text("YEARS",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w700),),
                                )
                                
                              ],
                            ),
                            Text("${_ageDuration.months == null ? "0" : _ageDuration.months} month | ${_ageDuration.days} days",style: TextStyle
                            (
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400
                            ),),
                          ],
                        ),
                      ),

                      //////////////Middle Line//////////////
                      Container(
                        height: 170,
                        width: 1,
                        color: Color(0xff999999),
                      ),
                      Container(
                        height: 200,
                        padding: EdgeInsets.symmetric(
                          vertical: 29),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text("NEXT BIRTHDAY",style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700
                            ),),
                               Icon(Icons.cake,color: Color(0xffCDDC39),size: 50,),
                               Text("${_weeks[_nextbdayWeekDay]}",style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700
                            ),),
                               Text("${_nextBirthday.months} month | ${_nextBirthday.days} days",style: TextStyle
                            (
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400
                            ),),
                            ],
                          ),
                      ),
                    ],
                  ),
                  Container(
                    height: 1,
                    width: double.maxFinite,
                    color: Color(0xff999999),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text("SUMMARY",style: TextStyle(color: Color(0xffCDDC39),fontSize: 18,fontWeight: FontWeight.w700),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("YEARS",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),),
                            SizedBox(
                              height: 5,
                            ),
                            Text("${_ageDuration.years}",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w400),),
                          ],
                        ),
                        Column(
                          children: [
                            Text("MONTH",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),),
                            SizedBox(
                              height: 5,
                            ),
                            Text("${(_ageDuration.years)*12 + (_ageDuration.months)}",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w400),),
                          ],
                        ),
                        Column(
                          children: [
                            Text("WEEK",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),),
                            SizedBox(
                              height: 5,
                            ),
                            Text("${(providerHelp.todayDate.difference(providerHelp.dob).inDays /7).floor()}",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w400),),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("DAYS",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),),
                            SizedBox(
                              height: 5,
                            ),
                            Text("${providerHelp.todayDate.difference(providerHelp.dob).inDays}",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                          ],
                        ),
                        Column(
                          children: [
                            Text("HOURS",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),),
                            SizedBox(
                              height: 5,
                            ),
                            Text("${providerHelp.todayDate.difference(providerHelp.dob).inHours}",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                          ],
                        ),
                        Column(
                          children: [
                            Text("MINUTES",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),),
                            SizedBox(
                              height: 5,
                            ),
                            Text("${providerHelp.todayDate.difference(providerHelp.dob).inMinutes}",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(onPressed: (){
                    dateCalculate();
                  },
            child: Container(
              color: Colors.white,
              height: 30,
              width: 80,
              child:Center(child: Text("Calculate",style: TextStyle(color: Colors.black),))
            ),)
                ],
              ),
              
            );
            
  }
}