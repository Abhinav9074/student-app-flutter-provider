// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/controller/screen_controller.dart';
import 'package:student_app_provider/views/add_student/add_student_screen.dart';
import 'package:student_app_provider/views/home/widgets/grid_view.dart';
import 'package:student_app_provider/views/home/widgets/search_widget.dart';
import 'package:student_app_provider/views/theme/theme.dart';


class HomeScreen extends StatelessWidget {
   const HomeScreen({super.key});



  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Home',
              style: MyTextStyle.appBarText,
            ),
            centerTitle: true,
          ),
          body:  SafeArea(
              child: Column(
                children: [
                  SearchWidget(),
                  const Expanded(child: StudentGrid()),
                ],
              )),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
               context.read<ScreenProvider>().clearImage();
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                return AddStudent();
              }));
            },
            child: const Icon(Icons.add),
          ),
        );
  }
}
