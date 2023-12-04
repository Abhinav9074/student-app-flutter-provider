import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/controller/screen_controller.dart';


// ignore: must_be_immutable
class SearchWidget extends StatelessWidget {
  SearchWidget({super.key});

  TextEditingController searchCont = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: searchCont,
        onChanged: (value) async {
          await context.read<ScreenProvider>().searchStudent(value);
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
              onPressed: () async{
                await context.read<ScreenProvider>().getStudents();
                searchCont.clear();
              },
              icon: const Icon(Icons.close)),
          border: const OutlineInputBorder(),
          label: const Text('Search Students'),
        ),
      ),
    );
  }
}
