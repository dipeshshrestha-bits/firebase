import 'package:firebase_learning/providers/person_provider.dart';
import 'package:firebase_learning/screens/detail_show_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPersonScreen extends StatefulWidget {
  const AddPersonScreen({super.key});

  @override
  State<AddPersonScreen> createState() => _AddPersonScreenState();
}

class _AddPersonScreenState extends State<AddPersonScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _professionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PersonProvider>(context);
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 25),
            Image(image: AssetImage("assets/dipesh.png"), width: 1000),
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 100),
              child: Text(
                "Enter Your Information",
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Container(
                padding: EdgeInsets.only(right: 20, left: 20),
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  border: Border.all(color: Colors.black.withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Your name",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                        ),
                        fillColor: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                padding: EdgeInsets.only(right: 20, left: 20),

                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  border: Border.all(color: Colors.black.withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: _ageController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Your Age",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                        ),
                        fillColor: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Container(
                padding: EdgeInsets.only(right: 20, left: 20),
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  border: Border.all(color: Colors.black.withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: _professionController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your Profession",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                        ),
                        fillColor: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: InkWell(
                onTap: () async {
                  final name = _nameController.text;
                  final age = int.tryParse(_ageController.text) ?? 0;
                  final profession = _professionController.text;

                  if (name.isEmpty || age == 0 || profession.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please fill all content"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                  
                  else{
                    final success =await provider.addPerson(name, age, profession);

                    if ( success){
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Person Data added Successfully"),
                        backgroundColor: Colors.green,
                      ),
                    );
                    }
                    else{
                       ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Failed to add Person data"),
                        backgroundColor: Colors.red,
                      ),
                    );
                       
                    }
                    _ageController.clear();
                    _nameController.clear();
                    _professionController.clear();
                  }

                  // Navigator.push(context ,MaterialPageRoute(builder: (_)=>WelcomeScreen()));
                },
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailShowScreen()));
            }, child: Text("Display Screen")),

            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                """By filling your details above you are 
           connecting to our database""",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
