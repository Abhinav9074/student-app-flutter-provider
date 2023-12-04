import 'package:hive_flutter/adapters.dart';
part 'student_model.g.dart';

@HiveType(typeId: 0)
class StudentModel{

  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String std;

  @HiveField(3)
  final String place;

  @HiveField(4)
  final String image;

  @HiveField(5)
  final String age;

  StudentModel({ required this.name, required this.std, required this.place, required this.image,required this.age,this.id});
}