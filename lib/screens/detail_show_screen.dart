import 'package:flutter/material.dart';

class DetailShowScreen extends StatelessWidget {
  const DetailShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Detail Screen",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
    );
  }
}