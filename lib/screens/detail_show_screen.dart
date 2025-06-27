import 'package:firebase_learning/models/person_model.dart';
import 'package:firebase_learning/providers/person_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailShowScreen extends StatelessWidget {
  const DetailShowScreen({super.key});

  void _editDialog(
    BuildContext context,
    Person person,
    PersonProvider PersonProvider,
  ) {
    final _nameController = TextEditingController(text: person.name);
    final _ageController = TextEditingController(text: person.age.toString());
    final _professionController = TextEditingController(
      text: person.profession,
    );
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Edit person"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(hintText: "Name"),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _ageController,
                  decoration: InputDecoration(hintText: "Age"),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _professionController,
                  decoration: InputDecoration(hintText: "Profession"),
                ),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("cancel"),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final updateData = Person(
                          id: person.id,
                          name: _nameController.text,
                          age: int.tryParse(_ageController.text) ?? person.age,
                          profession: _professionController.text,
                        );
                        await PersonProvider.updatePerson(updateData);
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Updated Successfully"),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      child: Text("submit"),
                    ),
                  ],
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PersonProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          "Person Display Screen",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: provider.persons.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              provider.persons[index].name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            leading: CircleAvatar(
              child: Text(provider.persons[index].name[0]),
              radius: 23,
            ),
            subtitle: Row(
              children: [
                Text(
                  "Age : ${provider.persons[index].age}",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    "Profession : ${provider.persons[index].profession}",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            ),
            trailing: PopupMenuButton(
              onSelected: (value)async {
                if (value == "edit") {
                  _editDialog(context, provider.persons[index], provider);
                } else if (value == "delete") {
                  await provider.deletePerson(provider.persons[index].id);
                }
              },
              itemBuilder:
                  (context) => [
                    PopupMenuItem(child: Text("Edit"), value: "edit"),
                    PopupMenuItem(child: Text("Delete"), value: "delete"),
                  ],
            ),
          );
        },
      ),
    );
  }
}
