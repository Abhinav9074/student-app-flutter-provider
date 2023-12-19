// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/controller/screen_controller.dart';
import 'package:student_app_provider/model/student_model.dart';
import 'package:student_app_provider/views/theme/theme.dart';

class AddStudent extends StatelessWidget {
  AddStudent({super.key});

  TextEditingController nameCont = TextEditingController();
  TextEditingController ageCont = TextEditingController();
  TextEditingController stdCont = TextEditingController();
  TextEditingController placeCont = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Student',
          style: MyTextStyle.appBarText,
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Consumer<ScreenProvider>(
              builder: (BuildContext context, screenProvider, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            controller: nameCont,
                            onChanged: (value) {
                              formKey.currentState!.validate();
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Name'),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This Value Is Required';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: ageCont,
                            onChanged: (value) {
                              formKey.currentState!.validate();
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Age'),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This Value Is Required';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: stdCont,
                            onChanged: (value) {
                              formKey.currentState!.validate();
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Standard'),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This Value Is Required';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            controller: placeCont,
                            onChanged: (value) {
                              formKey.currentState!.validate();
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Place'),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This Value Is Required';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                        onPressed: () async {
                          await screenProvider.pickImage();
                        },
                        icon: const Icon(Icons.upload),
                        label: const Text('Upload Image')),
                    SizedBox(
                        width: 150,
                        height: 150,
                        child: screenProvider.image.isEmpty
                            ? const Center(child: Text('No Image Uploaded'))
                            : Image.file(
                                File( screenProvider.image),
                                width: 150,
                                height: 150,
                              )),
                    ElevatedButton.icon(
                        onPressed: () async {
                          if (formKey.currentState!.validate() &&
                              screenProvider.image.isNotEmpty) {
                            final data = StudentModel(
                                name: nameCont.text,
                                std: stdCont.text,
                                place: placeCont.text,
                                image:  screenProvider.image,
                                age: ageCont.text);
                            await screenProvider.addStudent(data);
                            nameCont.clear();
                            stdCont.clear();
                            placeCont.clear();
                            ageCont.clear();

                            screenProvider.clearImage();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Added Successfully'),
                              backgroundColor: Colors.green,
                              behavior: SnackBarBehavior.floating,
                            ));
                          } else if (screenProvider.image.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Please Upload Image'),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                            ));
                          }
                        },
                        icon: const Icon(Icons.check),
                        label: const Text('Add Student'))
                  ],
                );
              }
            ),
          ),
        ),
      )),
    );
  }

}
