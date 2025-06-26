

import 'package:firebase_learning/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class AddPersonScreen extends StatefulWidget {
  const AddPersonScreen({super.key});

  @override
  State<AddPersonScreen> createState() => _AddPersonScreenState();
}

class _AddPersonScreenState extends State<AddPersonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      
     body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
       child: Column(
        children: [
          SizedBox(height: 25,),
          Image(image: AssetImage("assets/dipesh.png"),width: 1000,),
          Padding(
            padding: const EdgeInsets.only(top: 50,right: 100),
            child: Text("Enter Your Information",style: TextStyle(color: Colors.indigo,fontSize: 22,fontWeight: FontWeight.w500),),
          ),
          SizedBox(height: 15,),
         SizedBox(
          height: 200,
          
          
          
           child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            itemCount: information.length,
            itemBuilder: (context,index){
            return  Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 15),
              child: Container(
                
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  border: Border.all(color: Colors.black.withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        border:InputBorder.none,
                        hintText: information[index]['name'],hintStyle: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w200),fillColor: Colors.grey,
                        
                      ),
                    ),
                  ),
                  
                ),
                
              ),
            );
            
            
           }),
         ),
        
       
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          child: InkWell(
            onTap: () {
              Navigator.push(context ,MaterialPageRoute(builder: (_)=>WelcomeScreen()));
            },
            child: Container(
              height:50,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Center(child: Text("Submit",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),)),
            ),
          ),
        ),
       
        Padding(
          padding: const EdgeInsets.only(right:10,),
          child: Text("""By filling your details above your are 
           connecting to our database""",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w300),),
        )
        ],
       ),
     ),
    );
  }
}




List<Map> information=[

  {
    'name':"Enter Your Name"
  },

  {
    'name':"Enter Your Age"
  },

  {
    'name':"Enter Your Profession"
  },
];