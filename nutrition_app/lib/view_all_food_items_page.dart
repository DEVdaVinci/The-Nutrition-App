import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';
import 'package:nutrition_app/view_food_item_page.dart';
import 'package:nutrition_app/home_page.dart';

//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
import 'package:nutrition_app/food_item_class_template.dart';
//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx

class ViewAllFoodItemsPage extends StatefulWidget {
  ViewAllFoodItemsPage({required this.parentObject, required this.thisUser, super.key});
  dynamic parentObject;
  User thisUser;
  


  @override
  _ViewAllFoodItemsPageState createState() => _ViewAllFoodItemsPageState();
}

class _ViewAllFoodItemsPageState extends State<ViewAllFoodItemsPage> {

  List<FoodItem> foodItems = [];

  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> setUp() async
  {
    debugPrint("[ViewAllFoodItemsPage-> setUp()] getting all food items... ");
    List<Map<String, dynamic>> foodItemTable = await databaseHelper.getEntireTable_asMap(tableName: "FoodItemTable");
    debugPrint("[ViewAllFoodItemsPage-> setUp()] retrieved ${foodItemTable.length} food items... ");
    String name;
    debugPrint("[ViewAllFoodItemsPage-> setUp()] printing all food items... ---------------------------------------------------------------------------------");
    for(Map<String, dynamic> foodItem_map in foodItemTable)
    {
      name = foodItem_map["name"];
      debugPrint("[ViewAllFoodItemsPage-> setUp()]\t $name");
    }
    foodItems = foodItemTable.map((foodItem_map)=> FoodItem.fromMap(foodItem_map)).toList();

  }

  @override
  initState() {
    debugPrint("[ViewAllFoodItemsPage] Start");
    setUp().then((value){
      debugPrint("[ViewAllFoodItemsPage-> initState()] foodItem update COMPLETE");
        setState(() 
        {
        }
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      thisUser: widget.thisUser,
      home: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>(HomePage(thisUser: widget.thisUser,))),);},
      pageName: "FoodItems",
      body: [
            foodItems.isNotEmpty
             ? Column(
                children: foodItems.map((foodItem) {
                  return buildFoodItemCard(foodItem);
                }).toList(),
              )
            : TextButton(onPressed: () {}, child: Text("Loading...")),      ],
      
    );
    
    //Navigator.push(context, MaterialPageRoute(builder: (context) =>(widget.nextPage)),);
  }
   Widget buildFoodItemCard(FoodItem foodItem) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 5,
      child: InkWell(
        onTap: () { Navigator.push( context, MaterialPageRoute( builder: (context) => ViewFoodItemPage( thisFoodItem: foodItem, nextPage: ViewAllFoodItemsPage( thisUser: widget.thisUser, parentObject: widget.parentObject,), thisUser: widget.thisUser,), ),);},
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Center(
                child: Text(
                  foodItem.name.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
             
                  ),
                ),
              ),
              SizedBox(width: 8.0),
            //  Text(foodItem.details.toString()),
            ],
          ),
        ),
      ),
    );
  }
}

