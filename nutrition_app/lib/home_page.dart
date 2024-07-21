//import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:nutrition_app/custom_widgets.dart';
import 'package:nutrition_app/create_status_update_page.dart';
import 'package:nutrition_app/create_status_update_page_v2.dart';
import 'package:nutrition_app/create_blank_page_v2.dart';
import 'package:nutrition_app/create_consumed_food_page.dart';
import 'package:nutrition_app/create_food_item_page.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/login_page.dart';
import 'package:nutrition_app/view_all_status_updates_page.dart';
import 'package:nutrition_app/view_all_consumed_foods_page.dart';
import 'package:nutrition_app/view_all_food_items_page.dart';
import 'package:nutrition_app/view_food_items.dart';
import 'package:nutrition_app/create_food_item_nutrient_page.dart';
import 'package:nutrition_app/view_all_food_item_nutrients_page.dart';
import 'package:nutrition_app/create_nutrient_info_page.dart';
import 'package:nutrition_app/view_all_nutrient_infos_page.dart';
//import 'package:nutrition_app/create_new_food_items.dart';
import 'package:nutrition_app/database_helper.dart';






class HomePage extends StatefulWidget {
  HomePage({required this.thisUser, super.key});
  User thisUser;

  @override
  State<HomePage> createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {
  double buttonHeight = 50;
  double buttonWidth = 200;
  double spacerHeight = 15;
  
  DatabaseHelper databaseHelper = DatabaseHelper();

  
  int timestampToX_hours(DateTime timestamp)
  {
    //x = hours
      //each unit of the x axis represents an hour
    int year = timestamp.year * 8760;
    int month = timestamp.month * 720;
    int day = timestamp.day * 24;
    int hour = timestamp.hour * 1;

    int dateInt = day + month + year + hour;

    return dateInt;
  }

  int timestampToX_days(DateTime timestamp)
  {
    //x = days
      //each unit of the x axis represents a day
    int year = timestamp.year * 365;
    int month = timestamp.month * 30;
    int day = timestamp.day;

    int dateInt = day + month + year;

    return dateInt;
  }
  

  Future<Map<int, double>> totalConsumed(String nutrientName, DateTime start, DateTime end) async
  {
    debugPrint("[HomePage-> totalConsumed()] Start");
    
    //get all items where time stamp is >= start && timestaamp <= end
    List<ConsumedFood> matchingConsumedFoods = [];

    debugPrint("[HomePage-> totalConsumed()] retrieving consumed foods...");
    List<Map<String, dynamic>> matchingConsumedFoods_map = await databaseHelper.getMatchingRows(tableName: "ConsumedFoodTable", column: databaseHelper.colUserID, value: widget.thisUser.id!.toString());
    debugPrint("[HomePage-> totalConsumed()] processing...");
    matchingConsumedFoods = matchingConsumedFoods_map.map((consumedFood) => ConsumedFood.fromMap(consumedFood)).toList();

    debugPrint("[HomePage-> totalConsumed()] removing consumed foods that are out of intended time range");
    for (ConsumedFood consumedFood in matchingConsumedFoods) {
      if(consumedFood.timestamp.isBefore(start) || consumedFood.timestamp.isAfter(end))
      {
        matchingConsumedFoods.remove(consumedFood);
      }
      
    }
    
    Map<int, double> dataPoints = Map<int, double>();
    int newX;
    double newY;
    FoodItemNutrient newNutrient;
    for(ConsumedFood consumedFood in matchingConsumedFoods)
    {
      consumedFood.update();

      newX = timestampToX_days(consumedFood.timestamp);
      newNutrient = await consumedFood.foodItem!.getNutrient(nutrientName);

      if(dataPoints.containsKey(newX))
      {
        newY = dataPoints[newX]! + newNutrient.amount;
      }
      else
      {
        newY = newNutrient.amount;
      }
      dataPoints[newX] = newY;
    }

    debugPrint("[HomePage-> totalConsumed()] End");

    return dataPoints;
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(home: () { debugPrint("[HomePage-> build] Going to Log-In Page"); Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);}, pageName: "Home Page", thisUser: widget.thisUser, body: [Center(
      child: Column(children: [
        
        SizedBox(height: 25),
        Center(child:
          Column(children:[
            Row(children:[
              SizedBox(width: 200),
              SizedOutlinedButton(text: "Calories", height: buttonHeight, width: buttonWidth),
              SizedOutlinedButton(text: "BMI", height: buttonHeight, width: buttonWidth),
              SizedOutlinedButton(text: "Weight", height: buttonHeight, width: buttonWidth),
            ]),
            SizedBox(child: LineChartWidget(), height: 200, width: 700),
          ]),
        ),
        SizedBox(height: (spacerHeight * 2)),
        //SizedOutlinedButton(text: "View Food Items", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewFoodItems(nextPage: HomePage(thisUser: widget.thisUser,), thisUser: widget.thisUser)),);}),

        SizedBox(height: spacerHeight),
        //SizedOutlinedButton(text: "Add New Food Item", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CreateFoodItem(nextPage: HomePage(thisUser: widget.thisUser,), thisUser: widget.thisUser)),);}),
        

        SizedOutlinedButton(text: "Update Status", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CreateStatusUpdatePage(nextPage: HomePage(thisUser: widget.thisUser,), thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Update Status v2", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CreateStatusUpdatePage_v2(nextPage: HomePage(thisUser: widget.thisUser,), thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Add ConsumedFood", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CreateConsumedFoodPage(nextPage: HomePage(thisUser: widget.thisUser,), thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Add Food Item", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CreateFoodItemPage(nextPage: HomePage(thisUser: widget.thisUser,), thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Add Blank", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CreateBlankPage(nextPage: HomePage(thisUser: widget.thisUser,), thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Add Nutrient Info", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNutrientInfoPage(nextPage: HomePage(thisUser: widget.thisUser,), thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Add Food Item Nutrient", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CreateFoodItemNutrientPage(nextPage: HomePage(thisUser: widget.thisUser,), thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "View Status Updates", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllStatusUpdatesPage(parentObject:widget.thisUser, thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "View Food Items", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllFoodItemsPage(parentObject:widget.thisUser, thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "View Consumed Foods", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllConsumedFoodsPage(parentObject:widget.thisUser, thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "View All Nutrient Infos", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllNutrientInfosPage(thisUser: widget.thisUser)));}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "View Food Item Nutrientss", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllFoodItemNutrientsPage(parentObject:widget.thisUser, thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Sign Out", height: buttonHeight, width: buttonWidth, onPressed: () {displayDialogSignOut(context);},)
      ],),
    )]);
  }
}
