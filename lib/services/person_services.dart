import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_learning/models/person_model.dart';

class PersonServices {
  final _collection =FirebaseFirestore.instance.collection("persons");

  Future<void>addPerson(Person person)async{
    await _collection.doc(person.id).set(person.toJson());
  }

  Future<List<Person>>fetchPerson()async{
    final snapshot =await _collection.get();
    return snapshot.docs.map((data)=>Person.fromJson(data.data())).toList();
  }
}