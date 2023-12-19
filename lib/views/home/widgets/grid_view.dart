// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/controller/screen_controller.dart';
import 'package:student_app_provider/views/edit_student/edit_screen.dart';
import 'package:student_app_provider/views/student_details/details_screen.dart';

class StudentGrid extends StatelessWidget {
  const StudentGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenProvider>(
      builder: (BuildContext context, screenProvider, _) {
        return GridView.count(
          crossAxisCount: 2,
          children: List.generate(
              screenProvider.allStudentList.length, (index) {
            final data = screenProvider.allStudentList[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return StudentProfile(
                      name: data.name,
                      age: data.age,
                      std: data.std,
                      place: data.place,
                      image: data.image);
                }));
              },
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: FileImage(File(data.image)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      data.name,
                      style: const TextStyle(
                          fontFamily: 'Raleway-VariableFont_wght',
                          fontWeight: FontWeight.bold),
                    ),
                    ListTile(
                      leading: IconButton(
                        onPressed: () {
                          screenProvider.updateImage(data.image);
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (ctx) {
                            return EditStudent(
                                name: data.name,
                                age: data.age,
                                std: data.std,
                                place: data.place,
                                image: data.image,
                                id: data.id!);
                          }));
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      trailing: IconButton(
                        onPressed: () {

                          showDialog(
                              context: context,
                              builder: (ctx) {
                                return AlertDialog(
                                  title: const Text('Are You Sure',
                                      style: TextStyle(color: Colors.red)),
                                  content: const Text(
                                      'You Wont Be Able To Retrive The Data After This Operation'),
                                  actions: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: const Icon(Icons.close),
                                    ),
                                    IconButton(
                                        onPressed: () async {
                                          await screenProvider
                                              .deleteStudent(data.id!);
                                          Navigator.of(context).pop();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content: Text('Deleted Successfully'),
                                            backgroundColor: Colors.green,
                                            behavior: SnackBarBehavior.floating,
                                          ));
                                        },
                                        icon: const Icon(Icons.check))
                                  ],
                                );
                              });
                        },
                        icon: const Icon(Icons.delete, color: Colors.red),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        );
      }
    );
  }
}
