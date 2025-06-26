import 'package:firebase_learning/providers/person_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailShowScreen extends StatelessWidget {
  const DetailShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PersonProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Person Display Screen",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: provider.persons.length,
        itemBuilder: (context,index){
        return ListTile(
          title: Text(provider.persons[index].name,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
          leading: CircleAvatar(
            child: Text(provider.persons[index].name[0]),
            radius: 23,
          ),
          subtitle: Row(
            children: [
              Text("Age : ${provider.persons[index].age}",style: TextStyle(color: Colors.black,fontSize: 16),),
              SizedBox(width: 15,),
              Expanded(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  "Profession : ${provider.persons[index].profession}",style: TextStyle(color: Colors.black,fontSize: 16),))
            ],
          ),
          trailing: PopupMenuButton(itemBuilder: (context)=>[
            PopupMenuItem(child: Text("Edit"), value: "edit",),
             PopupMenuItem(child: Text("Delete"), value: "delete",),
          ],
        ),);
      },),
    );
  }
}