

import 'package:firebase_learning/screens/add_person_screen.dart';
import 'package:firebase_learning/screens/detail_show_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
     
      body: Column(
        children: [
         SizedBox(height: 150,),
          Center(child: Image(image: AssetImage("assets/congrats.gif"),height: 300,width: 500,)),
           Text("""Your information is recorded 
          successfully!!!""",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),

          SizedBox(height: 80,),


          Text("Do you want to look your information?",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 60),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            
            children: [
               InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailShowScreen()));
                  
                },
                 child: Container(
                               height: 30,
                               width: 50,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.indigo,),
                              child: Center(child: Text("Yes",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),)),
                             ),
               ),
             InkWell(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (_)=>AddPersonScreen()));
              },
               child: Container(
                height: 30,
                width: 50,
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.indigo,),
               child: Center(child: Text("No",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),)),
                           ),
             )
            ],
           ),
         )
        ],
      ),
    );
  }
}