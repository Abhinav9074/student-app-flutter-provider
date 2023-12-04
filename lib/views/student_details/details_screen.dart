

import 'dart:io';

import 'package:flutter/material.dart';

class StudentProfile extends StatelessWidget {
  final String name;
  final String age;
  final String std;
  final String place;
  final String image;

  const StudentProfile(
      {super.key,
      required this.name,
      required this.age,
      required this.std,
      required this.place,
      required this.image});

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    Widget imageWidget = image != null
        ? ClipOval(
            child: Image.file(File(image),width: 50,height: 50,fit: BoxFit.cover,),
          )
        : Container();

        // ignore: unnecessary_null_comparison
        Widget imageProfileWidget = image != null
        ? ClipOval(
            child:  Image.file(File(image),width: 200,height: 200,fit: BoxFit.cover,),
          )
        : Container();

    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: imageWidget,
          title: Text(name, style: const TextStyle(fontSize: 25,color: Colors.white ,fontFamily: 'Raleway-VariableFont_wght',fontWeight: FontWeight.bold),),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),
            imageProfileWidget,
            const SizedBox(height: 50,),
            Text(
              'Name : $name',
              style: const TextStyle(fontSize: 30,fontFamily: 'Raleway-VariableFont_wght',fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15,),
            Text(
              'Age : $age',
              style: const TextStyle(fontSize: 30,fontFamily: 'Raleway-VariableFont_wght',fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15,),
            Text(
              'Place : $place',
              style: const TextStyle(fontSize: 30,fontFamily: 'Raleway-VariableFont_wght',fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15,),
            Text(
              'Standard : $std',
              style: const TextStyle(fontSize: 30,fontFamily: 'Raleway-VariableFont_wght',fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
