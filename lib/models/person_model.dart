class Person {
  final String id;
  final String name;
  final int age;
  final String profession;

  Person({
    required this.id,
    required this.name,
    required this.age,
    required this.profession,
  });

  // Convert a Person object to JSON (Map)
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'age': age, 'profession': profession};
  }

  // Create a Person object from JSON (Map)
  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'] as String,
      name: json['name'] as String,
      age: json['age'] as int,
      profession: json['profession'] as String,
    );
  }
}