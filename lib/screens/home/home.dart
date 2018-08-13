import 'package:flutter/material.dart';
import 'package:circle_drawer/screens/home/components/circlepainter.dart';
import 'package:circle_drawer/models/circletype.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  CircleType circletype = CircleType.radians;
  String textvalue = "";

  void _handleRadioValueChange(CircleType _circletype) {
    setState(() {
      switch (_circletype) {
        case CircleType.radians:
          circletype = _circletype;
          break;
        case CircleType.degrees:
          circletype = _circletype;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: ListView(
          children: <Widget>[
            //Input Column
            Column(
              children: <Widget>[
                //CircleType Chooser
                Row(
                  children: <Widget>[
                    Radio(
                      groupValue: circletype,
                      value: CircleType.radians,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Radians", style: TextStyle(fontSize: 18.0)),
                    Radio(
                      groupValue: circletype,
                      value: CircleType.degrees,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Degrees", style: TextStyle(fontSize: 18.0)),
                  ],
                ),
                //Spacer
                SizedBox(height: 10.0),
                //Text Input
                TextField(
                  decoration: InputDecoration(
                    hintText:
                        "Shaded amount in ${circletype == CircleType.radians ? "Radians" : "Degrees"}",
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String value) {
                    setState(() {
                      textvalue = value;
                    });
                  },
                ),
              ],
            ),
            //Spacer
            SizedBox(height: 50.0),
            //Circle Paint
            SizedBox(
              height: 200.0,
              width: 200.0,
              child: CustomPaint(
                painter: CirclePainter(
                  shadedAmount: textvalue != "" ? double.parse(textvalue) : 0.0,
                  circleType: circletype,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
