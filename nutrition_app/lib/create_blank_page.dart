import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';

//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
import 'package:nutrition_app/blank_class_template.dart';
//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!


/*
Blank

required_var##
Required_Var##
Required Var With Space ###

optional_var##
Optional_Var##
Optional Var With Space ###
*/

class CreateBlankPage extends StatefulWidget {
  CreateBlankPage({required this.nextPage, required this.thisUser, super.key});
  final Widget nextPage;
  User thisUser;

  @override
  State<CreateBlankPage> createState() => _CreateBlankPageState();
}

class _CreateBlankPageState extends State<CreateBlankPage> {
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  TextEditingController required_var01Controller = TextEditingController();
  TextEditingController required_var02Controller = TextEditingController();
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  TextEditingController required_conversion_var01Controller = TextEditingController();
  TextEditingController required_conversion_var02Controller = TextEditingController();
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  TextEditingController optional_var01Controller = TextEditingController();
  TextEditingController optional_var02Controller = TextEditingController();
  TextEditingController optional_var03Controller = TextEditingController();
  TextEditingController optional_var04Controller = TextEditingController();
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  TextEditingController optional_conversion_var01Controller = TextEditingController();
  TextEditingController optional_conversion_var02Controller = TextEditingController();
  TextEditingController optional_conversion_var03Controller = TextEditingController();
  TextEditingController optional_conversion_var04Controller = TextEditingController();
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!

  late Blank newBlank;

  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> submit() async
  {
    debugPrint("[Create Blank With Space Page-> submit()] Start");

    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    late requiredVar01_DataType tempRequired_Var01 = requiredVar01_DataType.parse(required_var01Controller.text);
    late requiredVar02_DataType tempRequired_Var02 = requiredVar02_DataType.parse(required_var02Controller.text);
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    late required_conversionVar01_DataType tempRequired_Conversion_Var01 = required_conversionVar01_DataType.parse(required_conversion_var01Controller.text);
    late required_conversionVar02_DataType tempRequired_Conversion_Var02 = required_conversionVar02_DataType.parse(required_conversion_var02Controller.text);
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    optionalVar01_DataType? tempOptional_Var01 = optionalVar01_DataType.parse(optional_var01Controller.text);
    optionalVar02_DataType? tempOptional_Var02 = optionalVar02_DataType.parse(optional_var02Controller.text);
    optionalVar03_DataType? tempOptional_Var03 = optionalVar03_DataType.parse(optional_var03Controller.text);
    optionalVar04_DataType? tempOptional_Var04 = optionalVar04_DataType.parse(optional_var04Controller.text);
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    optional_conversionVar01_DataType? tempOptional_Conversion_Var01 = optional_conversionVar01_DataType.parse(optional_conversion_var01Controller.text);
    optional_conversionVar02_DataType? tempOptional_Conversion_Var02 = optional_conversionVar02_DataType.parse(optional_conversion_var02Controller.text);
    optional_conversionVar03_DataType? tempOptional_Conversion_Var03 = optional_conversionVar03_DataType.parse(optional_conversion_var03Controller.text);
    optional_conversionVar04_DataType? tempOptional_Conversion_Var04 = optional_conversionVar04_DataType.parse(optional_conversion_var04Controller.text);
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    
    



    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    newBlank = Blank(/*!!!!!*/Required_Var01: tempRequired_Var01, Required_Var02: tempRequired_Var02/*!!!!!*//*!!!!!*/, Required_Conversion_Var01: tempRequired_Conversion_Var01, Required_Conversion_Var02: tempRequired_Conversion_Var02/*!!!!!*//*!!!!!*/, Optional_Var01: tempOptional_Var01, Optional_Var02: tempOptional_Var02, Optional_Var03: tempOptional_Var03, Optional_Var04: tempOptional_Var04/*!!!!!*//*!!!!!*/, Optional_Conversion_Var01: tempOptional_Conversion_Var01, Optional_Conversion_Var02: tempOptional_Conversion_Var02, Optional_Conversion_Var03: tempOptional_Conversion_Var03, Optional_Conversion_Var04: tempOptional_Conversion_Var04/*!!!!!*/);
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!

    debugPrint("[Create Blank With Space Page-> submit()] Validating...");
    if (await newBlank.countMatching() >= 1) {
      setState(() {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("Creation failure!"),
                  content:
                      Text("The Blank already exists"),
                ));
        debugPrint(
            "[Create Blank With Space Page-> submit()]sign up fail! Blank already exists!!!!!!!!!!!!!!!!!!!!");
      });
    } else //if you are here then the combonation of alues for the required parameters hasn't been used yet
    {
      debugPrint("[Create Blank With Space Page-> submit()] the combo of values for the required parameters hasn't been used yet");
      

      int insertResult = await newBlank.create();

      if (insertResult != 0) {
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>(widget.nextPage)),); 
        });
      } else {
        setState(() {
          debugPrint("[Create Blank With Space Page-> submit()] Sign up failed!");
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text("Sign in failed!"),
                    content: Text("Insert operation failed!"),
                  ));
          debugPrint("[Create Blank With Space Page-> submit()] Sign up failed!");
        });
      }
    }
  }
  
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  Widget currentPage({/*!!!!!*/required required_var01Controller, required required_var02Controller/*!!!!!*//*!!!!!*/, required required_conversion_var01Controller, required required_conversion_var02Controller/*!!!!!*//*!!!!!*/, required optional_var01Controller, required optional_var02Controller, required optional_var03Controller, required optional_var04Controller/*!!!!!*//*!!!!!*/, required optional_conversion_var01Controller, required optional_conversion_var02Controller, required optional_conversion_var03Controller, required optional_conversion_var04Controller/*!!!!!*/})
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  { 
    return Center(
          child: Column(children: [
            const SizedBox(height: 60),
            const Text(
              'Blank',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),
            //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: required_var01Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Var With Space #01"),
              ),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: required_var02Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Required Variable With Space #02"),
              ),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: required_conversion_var01Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Required Conversion Variable With Space #01"),
              ),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: required_conversion_var02Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Required Conversion Variable With Space #02"),
              ),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: optional_var01Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Optional Var With Space #01"),
              ),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: optional_var02Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Optional Var With Space #02"),
              ),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: optional_var03Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Optional Var With Space #03"),
              ),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: optional_var04Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Optional Var With Space #04"),
              ),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: optional_conversion_var01Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Optional Conversion Variable With Space #01"),
              ),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: optional_conversion_var02Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Optional Conversion Variable With Space #02"),
              ),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: optional_conversion_var03Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Optional Conversion Variable With Space #03"),
              ),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: optional_conversion_var04Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Optional Conversion Variable With Space #04"),
              ),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                submit();
              },
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Center(
                    child: Text('Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ))),
              ),
            ),
          ]),
        );}


  @override
  initState() {
    debugPrint("[CreateBlankPage] Start");
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(pageName: "Create Blank With Space Page", body: [currentPage(/*!!!!!*/required_var01Controller: required_var01Controller, required_var02Controller: required_var02Controller/*!!!!!*//*!!!!!*/, required_conversion_var01Controller: required_conversion_var01Controller, required_conversion_var02Controller: required_conversion_var02Controller/*!!!!!*//*!!!!!*/, optional_var01Controller: optional_var01Controller, optional_var02Controller: optional_var02Controller, optional_var03Controller: optional_var03Controller, optional_var04Controller: optional_var04Controller/*!!!!!*//*!!!!!*/, optional_conversion_var01Controller: optional_conversion_var01Controller, optional_conversion_var02Controller: optional_conversion_var02Controller, optional_conversion_var03Controller: optional_conversion_var03Controller, optional_conversion_var04Controller: optional_conversion_var04Controller/*!!!!!*/)], thisUser: widget.thisUser,);
  }
}
