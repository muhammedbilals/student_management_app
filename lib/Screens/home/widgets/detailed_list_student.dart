import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_database/db/functions/db_functions.dart';
import 'package:student_database/db/model/data_model.dart';

class Details extends StatefulWidget {
  var data;

  Details({super.key, this.data});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  StudentModel? studentdata;
  // String? image;
  File? image;
  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) {
      return;
    }
    final imageTemporary = File(image.path);
    this.image = imageTemporary;

    // image = imagetemporary;
  }

  @override
  Widget build(BuildContext context) {
    // StudentDetails(studentdata);
    print(studentdata);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('students'),
        ),
        body: Column(

          children: [
            // Image.file(image!,width: 160,height: 160,),
            // ElevatedButton(
            //     onPressed: () {
            //       pickImage();
            //     },
                // child: Icon(Icons.camera_alt_outlined)),
            Center(
              child: Container(
                width: 1120,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle, color: Colors.amber),
                child: Column(
                  children: [
                    Text('Name:${widget.data.name}'),
                    Text('Age:${widget.data.age}'),
                    Text('Domain:${widget.data.domain}'),
                    Text('Number:${widget.data.Number}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// Future<StudentModel?> StudentDetails(index) async {
//   final studentDB = await Hive.openBox<StudentModel>('student_db');
//   final studentdata = studentDB.getAt(index);
//   return studentdata;
// }

}