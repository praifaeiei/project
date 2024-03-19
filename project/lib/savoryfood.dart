import 'package:flutter/material.dart';

class savoryfood extends StatefulWidget {
  @override
  _SavoryFoodState createState() => _SavoryFoodState();
}

class _SavoryFoodState extends State<savoryfood> {
  List<Map<String, String>> foodList = [];

  String foodName = '';
  String ingredients = '';
  String cookingSteps = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Savory Food'),
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Savory Food'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'ชื่อเมนูอาหาร',
                          ),
                          onChanged: (value) {
                            setState(() {
                              foodName = value;
                            });
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'ส่วนผสม',
                          ),
                          onChanged: (value) {
                            setState(() {
                              ingredients = value;
                            });
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'วิธีการทำ',
                          ),
                          onChanged: (value) {
                            setState(() {
                              cookingSteps = value;
                            });
                          },
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.pink), 
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            foodList.add({
                              'foodName': foodName,
                              'ingredients': ingredients,
                              'cookingSteps': cookingSteps,
                            });
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.pink), 
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ja.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView.builder(
            itemCount: foodList.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text(
                    foodList[index]['foodName'] ?? '',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipePage(
                          foodName: foodList[index]['foodName'] ?? '',
                          ingredients: foodList[index]['ingredients'] ?? '',
                          cookingSteps: foodList[index]['cookingSteps'] ?? '',
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RecipePage extends StatelessWidget {
  final String foodName;
  final String ingredients;
  final String cookingSteps;

  RecipePage({required this.foodName, required this.ingredients, required this.cookingSteps});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/ja.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            height: 700.0,
            width: 300.0,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8), 
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey), 
            ),
            child: SingleChildScrollView(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '$foodName',
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 8.0),
      Text(
        'ส่วนผสม : ',
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), // กำหนดเฉพาะส่วนหัวข้อเท่านั้น
      ),
      Text(
        '$ingredients',
        style: TextStyle(fontSize: 16.0), // ไม่กำหนด fontWeight เพื่อให้เป็นตัวธรรมดา
      ),
      SizedBox(height: 8.0),
      Text(
        'วิธีการทำ : ',
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), // กำหนดเฉพาะส่วนหัวข้อเท่านั้น
      ),
      Text(
        '$cookingSteps',
        style: TextStyle(fontSize: 16.0), // ไม่กำหนด fontWeight เพื่อให้เป็นตัวธรรมดา
      ),
    ],
  ),
),
          ),
        ),
      ),
    );
  }
}


void main() {
  runApp(MaterialApp(
    home: savoryfood(),
  ));
}
