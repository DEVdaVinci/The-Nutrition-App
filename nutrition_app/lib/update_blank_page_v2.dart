import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';

//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
import 'package:nutrition_app/blank_class_template.dart';
//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx


/*
Blank

required_var##
Required_Var##
Required Variable With Space ###

optional_var##
Optional_Var##
Optional Variable With Space ###
*/

class UpdateBlankPage extends StatefulWidget {
  UpdateBlankPage({required this.nextPage, required this.thisBlank, required this.thisUser, super.key});
  final Widget nextPage;
  Blank thisBlank;
  User thisUser;

  @override
  State<UpdateBlankPage> createState() => _UpdateBlankPageState();
}

class _UpdateBlankPageState extends State<UpdateBlankPage> {
  Map<String,Map<String, dynamic>> variablesInfo = Map<String,Map<String, dynamic>>();

  //late Blank newBlank;

  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> submit() async
  {
    debugPrint("\[UpdateBlankPage-> submit()] Start");

    String underscoreName;
    Map<String, dynamic> blankMap = Map<String, dynamic>();
    debugPrint("[CreateBlankPagev2-> submit()] creating map...");
    for (var entry in variablesInfo.entries) 
    {
      debugPrint("[CreateBlankPagev2-> submit()]\tprocessing ${entry.key} info...");
      debugPrint("[CreateBlankPagev2-> submit()]\t\texcecuting: underscoreName = entry.value[\"name_with_underscore\"];...");
      underscoreName = entry.value["name_with_underscore"];
      
      debugPrint("[CreateBlankPagev2-> submit()]\t\t checking data type of ${entry.key}");
      debugPrint("[CreateBlankPagev2-> submit()]\t\t${entry.key}'s data type: ${entry.value["DataType"]}");
      if(entry.value["DataType"] == String)
      {
        debugPrint("[CreateBlankPagev2-> submit()]\t\t${entry.key} is a String");
        blankMap[underscoreName] = entry.value["TextEditingController"].text;
      }
      else
      {
        debugPrint("[CreateBlankPagev2-> submit()]\t\t${entry.key} is not a String");
        if(entry.value["DataType"] == int)
        {
          blankMap[underscoreName] = int.parse(entry.value["TextEditingController"].text);
        }
        else if(entry.value["DataType"] == double)
        {
          blankMap[underscoreName] = double.parse(entry.value["TextEditingController"].text);
        }
        else
        {
          blankMap[underscoreName] = entry.value["TextEditingController"].text;
        }
        
      }
    }
    
    debugPrint("[CreateBlankPagev2-> submit()] creating the updated blank...");
    widget.thisBlank.fromMap(blankMap);
    

    debugPrint("\[UpdateBlankPage-> submit()] Updating...");
    int updateResult = await widget.thisBlank.update();

    if (updateResult != 0) {
      setState(() {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>(widget.nextPage)),); 
      });
    } else {
      setState(() {
        debugPrint("\[UpdateBlankPage-> submit()] Update failed!");
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("Update failed!"),
                  content: Text("Update operation failed!"),
                ));
        debugPrint("\[UpdateBlankPage-> submit()] Update failed!");
      });
    }


    
  }
  
  Widget currentPage({required variablesInfo})
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

            ...variablesInfo.entries.map((variableInfo) => Column(children: [
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: variableInfo.value["TextEditingController"]/*variablesInfo["required_var01"]!["TextEditingController"]*/,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: variableInfo.value["NameWithSpace"]/*"Required Variable With Space #01"*/),
                ),
              ),
            ])),

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
    debugPrint("[UpdateBlankPage] Start");

    debugPrint("[CreateBlankPage] Start");
    //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    variablesInfo["required_var01"] = <String, dynamic>{};
    variablesInfo["required_var01"]!["TextEditingController"] = TextEditingController();
    variablesInfo["required_var01"]!["DataType"] = requiredVar01_DataType;
    variablesInfo["required_var01"]!["name_with_underscore"] = "required_var_underscore01";
    variablesInfo["required_var01"]!["NameWithSpace"] = "Required Variable With Space #01";
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    variablesInfo["required_var02"] = <String, dynamic>{};
    variablesInfo["required_var02"]!["TextEditingController"] = TextEditingController();
    variablesInfo["required_var02"]!["DataType"] = requiredVar02_DataType;
    variablesInfo["required_var02"]!["name_with_underscore"] = "required_var_underscore02";
    variablesInfo["required_var02"]!["NameWithSpace"] = "Required Variable With Space #02";
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    variablesInfo["required_var03"] = <String, dynamic>{};
    variablesInfo["required_var03"]!["TextEditingController"] = TextEditingController();
    variablesInfo["required_var03"]!["DataType"] = requiredVar03_DataType;
    variablesInfo["required_var03"]!["name_with_underscore"] = "required_var_underscore03";
    variablesInfo["required_var03"]!["NameWithSpace"] = "Required Variable With Space #03";
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    variablesInfo["required_var04"] = <String, dynamic>{};
    variablesInfo["required_var04"]!["TextEditingController"] = TextEditingController();
    variablesInfo["required_var04"]!["DataType"] = requiredVar04_DataType;
    variablesInfo["required_var04"]!["name_with_underscore"] = "required_var_underscore04";
    variablesInfo["required_var04"]!["NameWithSpace"] = "Required Variable With Space #04";
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    variablesInfo["required_conversion_var01"] = <String, dynamic>{};
    variablesInfo["required_conversion_var01"]!["TextEditingController"] = TextEditingController();
    variablesInfo["required_conversion_var01"]!["DataType"] = required_conversionVar01_DataType;
    variablesInfo["required_conversion_var01"]!["name_with_underscore"] = "required_conversion_var_underscore01";
    variablesInfo["required_conversion_var01"]!["NameWithSpace"] = "Required Conversion Variable With Space #01";
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    variablesInfo["required_conversion_var02"] = <String, dynamic>{};
    variablesInfo["required_conversion_var02"]!["TextEditingController"] = TextEditingController();
    variablesInfo["required_conversion_var02"]!["DataType"] = required_conversionVar02_DataType;
    variablesInfo["required_conversion_var02"]!["name_with_underscore"] = "required_conversion_var_underscore02";
    variablesInfo["required_conversion_var02"]!["NameWithSpace"] = "Required Conversion Variable With Space #02";
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    variablesInfo["required_conversion_var03"] = <String, dynamic>{};
    variablesInfo["required_conversion_var03"]!["TextEditingController"] = TextEditingController();
    variablesInfo["required_conversion_var03"]!["DataType"] = required_conversionVar03_DataType;
    variablesInfo["required_conversion_var03"]!["name_with_underscore"] = "required_conversion_var_underscore03";
    variablesInfo["required_conversion_var03"]!["NameWithSpace"] = "Required Conversion Variable With Space #03";
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    variablesInfo["required_conversion_var04"] = <String, dynamic>{};
    variablesInfo["required_conversion_var04"]!["TextEditingController"] = TextEditingController();
    variablesInfo["required_conversion_var04"]!["DataType"] = required_conversionVar04_DataType;
    variablesInfo["required_conversion_var04"]!["name_with_underscore"] = "required_conversion_var_underscore04";
    variablesInfo["required_conversion_var04"]!["NameWithSpace"] = "Required Conversion Variable With Space #04";
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    variablesInfo["optional_var01"]!["TextEditingController"] = TextEditingController();
    variablesInfo["optional_var01"]!["DataType"] = optionalVar01_DataType;
    variablesInfo["optional_var01"]!["name_with_underscore"] = "optional_var_underscore01";
    variablesInfo["optional_var01"]!["NameWithSpace"] = "Optional Variable With Space #01";
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    variablesInfo["optional_var02"]!["TextEditingController"] = TextEditingController();
    variablesInfo["optional_var02"]!["DataType"] = optionalVar02_DataType;
    variablesInfo["optional_var02"]!["name_with_underscore"] = "optional_var_underscore02";
    variablesInfo["optional_var02"]!["NameWithSpace"] = "Optional Variable With Space #02";
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    variablesInfo["optional_var03"]!["TextEditingController"] = TextEditingController();
    variablesInfo["optional_var03"]!["DataType"] = optionalVar03_DataType;
    variablesInfo["optional_var03"]!["name_with_underscore"] = "optional_var_underscore03";
    variablesInfo["optional_var03"]!["NameWithSpace"] = "Optional Variable With Space #03";
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    variablesInfo["optional_var04"]!["TextEditingController"] = TextEditingController();
    variablesInfo["optional_var04"]!["DataType"] = optionalVar04_DataType;
    variablesInfo["optional_var04"]!["name_with_underscore"] = "optional_var_underscore04";
    variablesInfo["optional_var04"]!["NameWithSpace"] = "Optional Variable With Space #04";
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    variablesInfo["optional_conversion_var01"]!["TextEditingController"] = TextEditingController();
    variablesInfo["optional_conversion_var01"]!["DataType"] = optional_conversionVar01_DataType;
    variablesInfo["optional_conversion_var01"]!["name_with_underscore"] = "optional_conversion_var_underscore01";
    variablesInfo["optional_conversion_var01"]!["NameWithSpace"] = "Optional Conversion Variable With Space #01";
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    variablesInfo["optional_conversion_var02"]!["TextEditingController"] = TextEditingController();
    variablesInfo["optional_conversion_var02"]!["DataType"] = optional_conversionVar02_DataType;
    variablesInfo["optional_conversion_var02"]!["name_with_underscore"] = "optional_conversion_var_underscore02";
    variablesInfo["optional_conversion_var02"]!["NameWithSpace"] = "Optional Conversion Variable With Space #02";
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    variablesInfo["optional_conversion_var03"]!["TextEditingController"] = TextEditingController();
    variablesInfo["optional_conversion_var03"]!["DataType"] = optional_conversionVar03_DataType;
    variablesInfo["optional_conversion_var03"]!["name_with_underscore"] = "optional_conversion_var_underscore03";
    variablesInfo["optional_conversion_var03"]!["NameWithSpace"] = "Optional Conversion Variable With Space #03";
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    variablesInfo["optional_conversion_var04"]!["TextEditingController"] = TextEditingController();
    variablesInfo["optional_conversion_var04"]!["DataType"] = optional_conversionVar04_DataType;
    variablesInfo["optional_conversion_var04"]!["name_with_underscore"] = "optional_conversion_var_underscore04";
    variablesInfo["optional_conversion_var04"]!["NameWithSpace"] = "Optional Conversion Variable With Space #04";
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
  }

  @override
  Widget build(BuildContext context) {
    
    return PageWidget(pageName: "Update Blank With Space Page", body: [currentPage(variablesInfo: variablesInfo)], thisUser: widget.thisUser,);
    
  }
}
