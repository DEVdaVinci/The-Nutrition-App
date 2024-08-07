import 'package:flutter/material.dart';
import 'package:multiple_search_selection/multiple_search_selection.dart';
import 'package:nutrition_app/main.dart';
import 'package:nutrition_app/home_page.dart';
import 'package:nutrition_app/settings_page.dart';
import 'package:nutrition_app/classes.dart';
import 'package:fl_chart/fl_chart.dart';

class PageWidget extends StatefulWidget {
  PageWidget({this.home, required this.pageName, required this.body, required this.thisUser, this.onPressed, this.lastPage, this.editPage, this.currentIndex = 0, super.key});
  String pageName;
  List<Widget> body;
  void Function()? home;
  void Function()? onPressed;
  Widget? lastPage;
  Widget? editPage;
  int currentIndex;
  User thisUser;

  @override
  State<PageWidget> createState() => _PageWidgetState();
}

class _PageWidgetState extends State<PageWidget> {
  @override
  Widget build(BuildContext context) {

    return Scaffold( 
            resizeToAvoidBottomInset : true,
            backgroundColor: Colors.grey[300],

            appBar: AppBar(actions: [
              IconButton(onPressed: widget.home ?? (){debugPrint("[${widget.pageName}] widget.home was empty. Navigating to default which is HomePage()...");Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(thisUser: widget.thisUser)));}, icon: Icon(Icons.home), color: Colors.white), 
              (widget.lastPage != null) ? IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => widget.lastPage!),), icon: Icon(Icons.close ), color: Colors.white) : Container(),
              
              (widget.editPage != null) ? IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => widget.editPage!),), icon: Icon(Icons.edit )) : SizedBox.shrink(),
              IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(thisUser: widget.thisUser)),), icon: Icon(Icons.account_circle ), color: Colors.white),

              IconButton(onPressed: () { displayDialogSignOut(context);}, icon: Icon(Icons.exit_to_app), color: Colors.white),


            ], 
            title: Text(widget.pageName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold )),
            backgroundColor: Colors.green,
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(children: widget.body, ),
                ),
              ],
            ),
            //bottomNavigationBar: bottomNavigationBar(currentIndex: widget.currentIndex, onTap: (index) => setState(() => widget.currentIndex = index),),
          );
  }
}

class ViewAllPageWidget extends StatefulWidget {
  ViewAllPageWidget({this.home, required this.pageName, required this.body, required this.thisUser, this.onPressed, required this.createPage, this.currentIndex = 0, super.key});
  String pageName;
  List<Widget> body;
  void Function()? home;
  void Function()? onPressed;
  Widget createPage;
  int currentIndex;
  User thisUser;

  @override
  State<ViewAllPageWidget> createState() => _ViewAllPageWidgetState();
}

class _ViewAllPageWidgetState extends State<ViewAllPageWidget> {
  @override
  Widget build(BuildContext context) {

    return Scaffold( 
            resizeToAvoidBottomInset : true,
            appBar: AppBar(actions: [
              IconButton(onPressed: widget.home ?? (){debugPrint("[${widget.pageName}] widget.home was empty. Navigating to default which is HomePage()...");Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(thisUser: widget.thisUser)));}, icon: Icon(Icons.home)), 
              IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(thisUser: widget.thisUser)),), icon: Icon(Icons.account_circle ))
            ], 
            title: Text(widget.pageName)),
            body: Column(
              children: [
                SingleChildScrollView(
                  child: Column(children: widget.body, ),
                ),
              ],
            ),
            floatingActionButton: ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => widget.createPage),);}, child: const Icon(Icons.add)),
            //bottomNavigationBar: bottomNavigationBar(currentIndex: widget.currentIndex, onTap: (index) => setState(() => widget.currentIndex = index),),
          );
  }
}


class CardWidget extends StatefulWidget {
  CardWidget(
      {required this.title,
      required this.body,
      this.cardColor = const Color.fromARGB(135, 63, 41, 207),
      this.appBarColor = const Color.fromARGB(160, 18, 0, 138),
      this.onCardTap,
      super.key});
  Color cardColor;
  Color appBarColor;
  String title;
  List<Widget> body;
  void Function()? onCardTap;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;
    return Card(
      
      color: widget.cardColor,
      elevation: 30,
      // clipBehavior is necessary because, without it, the InkWell's animation
      // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
      // This comes with a small performance cost, and you should not set [clipBehavior]
      // unless you need it.
      clipBehavior: Clip.hardEdge,

      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),

        onDoubleTap: widget.onCardTap,
        child: SizedBox(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: widget.appBarColor,
                toolbarHeight: 25,
                title: Text(title),
              ),
              ...widget.body,
            ],
          ),
        ),
      ),
    );
  }
}

int isLeapYear(int year)
{
        if(year % 100 == 0)
        {
            if(year % 400 == 0)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }
        else if(year % 4 == 0)
        {
            return 1;
        }
        else
        {
            return 0;
        }
        
}

Widget getXAxisTitles(double value, TitleMeta meta){
  int tempX = value.toInt();
  int year = (tempX ~/ 365);
  tempX %= 365;

  int leapYear = isLeapYear(year);

  int daysJan = 1;
  int daysFeb = daysJan + 31;
  int daysMar = daysFeb + 28 + leapYear;
  int daysApr = daysMar + 31;
  int daysMay = daysApr + 30;
  int daysJun = daysMay + 31;
  int daysJul = daysJun + 30;
  int daysAug = daysJul + 31;
  int daysSep = daysAug + 31;
  int daysOct = daysSep + 30;
  int daysNov = daysOct + 31;
  int daysDec = daysNov + 30;
  
  if(tempX == daysJan)
  {
    return Text('January');
  }
  else if(tempX == daysFeb)
  {
    return Text('February');
  }
  else if(tempX == daysMar)
  {
    return Text('March');
  }
  else if(tempX == daysApr)
  {
    return Text('April');
  }
  else if(tempX == daysMay)
  {
    return Text('May');
  }
  else if(tempX == daysJun)
  {
    return Text('June');
  }
  else if(tempX == daysJul)
  {
    return Text('July');
  }
  else if(tempX == daysAug)
  {
    return Text('August');
  }
  else if(tempX == daysSep)
  {
    return Text('September');
  }
  else if(tempX == daysOct)
  {
    return Text('October');
  }
  else if(tempX == daysNov)
  {
    return Text('November');
  }
  else if(tempX == daysDec)
  {
    return Text('Decemberrr');
  }
  else
  {
    return Container();
  }
}

Widget getYAxisTitles(double value, TitleMeta meta, double maxY)
{
  int divisor = 1;
  while(divisor < maxY)
  {
    divisor *= 10;
  }
  divisor = (divisor/10).toInt();

  for(var i = 0; i <= (maxY/divisor).floor(); i++) {
    if(value == divisor*i)
    {
      return SizedBox(width: 50, child: Text((divisor*i).toString()));
    }
    
  }

  return Container();
}



class SizedOutlinedButton extends StatefulWidget {
  SizedOutlinedButton({required this.text, required this.height, required this.width, this.onPressed, super.key});
  String text;
  double height;
  double width;
  void Function()? onPressed;
  

  @override
  State<SizedOutlinedButton> createState() => _SizedOutlinedButtonState();
}

class _SizedOutlinedButtonState extends State<SizedOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        
        Container( height: widget.height, width: widget.width, child: OutlinedButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll <Color>(Colors.green),), onPressed: widget.onPressed, child: Text(widget.text, style: TextStyle(color: Colors.white))),),
      ],
    );
  }
}

/*class bottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const bottomNavigationBar({Key? key, required this.currentIndex, required this.onTap}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
       items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Home',
            backgroundColor: Colors.green,
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lunch_dining),
            label: 'Add New Food',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Add New \n Recipie',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.breakfast_dining),
            label: 'Add Consumed \n        Food',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Update Status',
            backgroundColor: Colors.green,
          ),
        ],
      

    );
  }
}*/
class WeightLineGraph extends StatefulWidget {
  WeightLineGraph({required this.spots, required this.minX, required this.maxX, required this.maxY, super.key});
  List<FlSpot> spots;
  double minX;
  double maxX;
  double maxY;
  @override
  State<WeightLineGraph> createState() => _WeightLineGraphState();
}

class _WeightLineGraphState extends State<WeightLineGraph> {
  @override
  Widget build(BuildContext context) {
    
    return LineChart(
      
      LineChartData(
        minX: widget.minX,
        maxX: widget.maxX,
        maxY: widget.maxY,
        minY: 0,
        lineBarsData: [
          LineChartBarData(
             spots: widget.spots,
            isCurved: true,
            color: Colors.green
      
           
          
          ),
        ],
        
        titlesData: FlTitlesData(
          topTitles: AxisTitles(
            
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) => getXAxisTitles(value, meta),
            
           interval: 1,
          )
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              
              showTitles: true,
            getTitlesWidget: (value, meta) => getYAxisTitles(value, meta, widget.maxY),
            interval: 50,
            ),
          ),
        ),
      ),

    );
  }
}

void displayDialogSignOut(BuildContext context){
  showDialog(
    context: context,
    builder: (BuildContext context){
      return AlertDialog(
        content: Text("Are you sure you want to sign out?"),

        actions: <Widget>[
          TextButton(
            child: Text('Cancel', style: TextStyle(color: Colors.green),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text("Sign Out", style: TextStyle(color: Colors.green),),
            
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/loginpage');
            },
            
          ),
        ],
      );
    },
  );
}

class CalorieLineGraph extends StatefulWidget {
  CalorieLineGraph({required this.spots, required this.minX, required this.maxX, required this.maxY, required this.minY, super.key});
  List<FlSpot> spots;
  double minX;
  double maxX;
  double maxY;
  double minY;

  @override
  State<CalorieLineGraph> createState() => _CalorieLineGraphState();
}

class _CalorieLineGraphState extends State<CalorieLineGraph> {
  @override
  Widget build(BuildContext context) {
    
    return LineChart(
      LineChartData(
        minX: widget.minX,
        maxX: widget.maxX,
        maxY: widget.maxY,
        minY: 0,//widget.minY,
        lineBarsData: [
          LineChartBarData(
             spots: widget.spots,
            isCurved: true,
            color: Colors.green
          ),
        ],
        
        titlesData: FlTitlesData(
          topTitles: AxisTitles(
            
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) => getXAxisTitles(value, meta),
            interval: 1,
            )
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
            getTitlesWidget: (value, meta) => getYAxisTitles(value, meta, widget.maxY),
            interval: 1,
            ),
          ),
        ),
      ),

    );
  }
}
class BMILineGraph extends StatefulWidget {
  BMILineGraph ({required this.spots, required this.minX, required this.maxX, required this.maxY, super.key});
  List<FlSpot> spots;
  double minX;
  double maxX;
  double maxY;

  @override
  State<BMILineGraph> createState() => _BMILineGraphState();
}

class _BMILineGraphState extends State<BMILineGraph> {
  @override
  Widget build(BuildContext context) {
    
    return LineChart(
      LineChartData(
        minX: widget.minX,
        maxX: widget.maxX,
        maxY: widget.maxY,
        lineBarsData: [
          LineChartBarData(
             spots: widget.spots,
            isCurved: true,
            color: Colors.green
      
           
          
          ),
        ],
        
        titlesData: FlTitlesData(
          topTitles: AxisTitles(
            
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta){
              int tempX = value.toInt();
              int year = (tempX / 365).toInt();
              tempX %= 365;

              int leapYear = isLeapYear(year);

              int daysJan = 1;
              int daysFeb = daysJan + 31;
              int daysMar = daysFeb + 28 + leapYear;
              int daysApr = daysMar + 31;
              int daysMay = daysApr + 30;
              int daysJun = daysMay + 31;
              int daysJul = daysJun + 30;
              int daysAug = daysJul + 31;
              int daysSep = daysAug + 31;
              int daysOct = daysSep + 30;
              int daysNov = daysOct + 31;
              int daysDec = daysNov + 30;
              
              if(tempX == daysJan)
              {
                return Text('January');
              }
              else if(tempX == daysFeb)
              {
                return Text('February');
              }
              else if(tempX == daysMar)
              {
                return Text('March');
              }
              else if(tempX == daysApr)
              {
                return Text('April');
              }
              else if(tempX == daysMay)
              {
                return Text('May');
              }
              else if(tempX == daysJun)
              {
                return Text('June');
              }
              else if(tempX == daysJul)
              {
                return Text('July');
              }
              else if(tempX == daysAug)
              {
                return Text('August');
              }
              else if(tempX == daysSep)
              {
                return Text('September');
              }
              else if(tempX == daysOct)
              {
                return Text('October');
              }
              else if(tempX == daysNov)
              {
                return Text('November');
              }
              else if(tempX == daysDec)
              {
                return Text('Decemberrr');
              }
              else
              {
                return Container();
              }
            },
           interval: 1,
          )
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              
              showTitles: true,
            getTitlesWidget: (value, meta){
              switch(value.toInt()){
                case 11.0:
                  return Text('11');
                case 12.0:
                  return Text('12');
                case 13.0:
                  return Text('13');
                case 14.0:
                  return Text('14');
                case 15.0:
                  return Text('15');
                case 16.0:
                  return Text('16');
                
                default:
                  return Container();
              }
            },
            interval: 1,
            ),
          ),
        ),
      ),

    );
  }
}

// Future <void> showTime(BuildContext context) async{
//     TimeOfDay userSelectedTime = TimeOfDay.now();
//    final TimeOfDay? time = await showTimePicker(context: context, initialTime: userSelectedTime, initialEntryMode: TimePickerEntryMode.dial);
//                       if(time != null){
//                         setState(() {
//                           userSelectedTime = time;
//                         });
//                       }
//                     }

