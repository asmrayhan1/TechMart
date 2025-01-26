import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/text_field/custom_text_field.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // const CustomTextField(
              //   title: "Task title",
              //   hint: "Scrom Landing Page",
              //   min: 1,
              //   max: 2,
              // ),
              // const CustomTextField(
              //   min: 3,
              //   max: 6,
              //   title: "Description",
              //   hint: "project description",
              // ),
            ],
          )
        ),
      ),
    );
  }
}
