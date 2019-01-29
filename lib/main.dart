import 'package:flutter/material.dart';
import 'package:flight/CustomShapeClipper.dart';

void main() => runApp(MyHome());

Color firstColor = Color(0xFFF47D17);
Color secondColor = Color(0xFFEF772C);

ThemeData appTheme =
    ThemeData(primaryColor: Color(0xFFF3791A), fontFamily: 'Oxygen');

List<String> locations = ['Boston (BOS)', 'New York City (JFK)'];

const TextStyle dropDownLabelStyle =
    TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropDownMenuItemStyle =
    TextStyle(color: Colors.black, fontSize: 18.0);

class MyHome extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[HomeScreenTopPart()],
      ),
    );
  }
}

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomScreenTopPartState createState() => _HomScreenTopPartState();
}

class _HomScreenTopPartState extends State<HomeScreenTopPart> {
  var selectedLocationIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: 400.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [firstColor, secondColor]),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        PopupMenuButton(
                          onSelected: (index) {
                            setState(() {
                              selectedLocationIndex = index;
                            });
                          },
                          child: Row(
                            children: <Widget>[
                              Text(
                                locations[selectedLocationIndex],
                                style: dropDownLabelStyle,
                              ),
                            ],
                          ),
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuItem<int>>[
                                PopupMenuItem(
                                  child: Text(
                                    locations[0],
                                    style: dropDownMenuItemStyle,
                                  ),
                                  value: 0,
                                ),
                                PopupMenuItem(
                                  child: Text(
                                    locations[1],
                                    style: dropDownMenuItemStyle,
                                  ),
                                  value: 1,
                                ),
                              ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.settings,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    'Where would\nyou want to go?',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                      child: TextField(
                        controller: TextEditingController(
                          text: locations[1],
                        ),
                        style: dropDownMenuItemStyle,
                        cursorColor: appTheme.primaryColor,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
                          suffixIcon: Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            child: Icon(Icons.search, color: Colors.black,),
                          )
                        ),
                      ),
                    ),
                  ),
                  Row(children: <Widget>[

                  ],)
                ],
              ),
            ))
      ],
    );
  }
}
