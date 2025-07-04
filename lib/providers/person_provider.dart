import 'package:firebase_learning/models/person_model.dart';
import 'package:firebase_learning/services/person_services.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class PersonProvider extends ChangeNotifier {
  PersonServices _services = PersonServices();
  List<Person> _person = [];
  List<Person> get persons => _person;

  PersonProvider(){
    fetchPerson();
  }

  Future<void> fetchPerson() async {
    _person = await _services.fetchPerson();
    notifyListeners();
  }

  Future<bool> addPerson(String name, int age, String profession) async {
    final person = Person(
      id: Uuid().v4(),
      name: name,
      age: age,
      profession: profession,
    );

    await _services.addPerson(person);
    notifyListeners();
    await fetchPerson();
    notifyListeners();
    return true;
  }

  Future<bool>updatePerson(Person person)async{
    await _services.updatePerson(person);
    notifyListeners();
    fetchPerson();
    notifyListeners();
    return true;
}

Future<void>deletePerson(String id)async{
  await _services.deletePerson(id);
  notifyListeners();
  await fetchPerson();
  notifyListeners();
}
}