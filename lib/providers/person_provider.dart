import 'package:firebase_learning/models/person_model.dart';
import 'package:firebase_learning/services/person_services.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class PersonProvider extends ChangeNotifier {
  PersonServices _services = PersonServices();
  List<Person> _person = [];
  List<Person> get persons => _person;

  Future<void> fetchPerson() async {
    _person = await _services.fetchPerson();
    notifyListeners();
  }

  Future<void> addPerson(String name, int age, String profession) async {
    final person = Person(
      id: Uuid().v4(),
      name: name,
      age: age,
      profession: profession,
    );

    await _services.addPerson(person);
    notifyListeners();
  }
}
