import 'package:age_calculator/helper/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Header extends StatefulWidget {
  
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
    List<String> _months = [
    "months",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "Octobar",
    "November",
    "December"
  ];

  @override
  Widget build(BuildContext context) {
    final providerHelper = Provider.of<ProviderHelper>(context);
    return Column(
      children: [
        SizedBox(
              height: 30,
              width: double.maxFinite,
            ),
            Text("AGE CALCULATOR",style: 
            TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w700),),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Today", style: 
                TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20),),
                Row(
                  children: [
                Consumer<ProviderHelper>(builder: (_, today, __){
                  return Text("${today.todayDate.day} ${_months[today.todayDate.month]} ${today.todayDate.year}",style: 
                  TextStyle(color: Color(0xffCDDC39),fontWeight: FontWeight.w400,fontSize: 20),);
  }),
                SizedBox(width: 10,),
                GestureDetector(
                    onTap: (){
                     providerHelper.selectTodayDate(context);
                    },
                    child: Icon(Icons.calendar_today,color: Colors.white,))
                
                  ],
                ),

              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Date Of Birth", style: 
                TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20),),
                Row(
                  children: [
                    Consumer<ProviderHelper>(builder: (_, dobData,__){
                      return Text("${dobData.dob.day} ${_months[dobData.dob.month]} ${dobData.dob.year}",style: 
                                    TextStyle(color: Color(0xffCDDC39),fontWeight: FontWeight.w400,fontSize: 20),);
                    }),
                SizedBox(width: 10,),
                GestureDetector(
                    onTap: (){
                       providerHelper.selectDOBDate(context);
                    },
                    child: Icon(Icons.calendar_today,color: Colors.white,)
                )
                  ],
                ),

              ],
            ),
      ],
      
    );
  }
}