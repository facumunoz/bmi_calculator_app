import 'package:bmi_calculator/CardView.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmi, @required this.description, @required this.comment});

  String bmi;
  String description;
  String comment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.all(15.0),
              child: Text(
                'Your Result',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CardView(
              color: kActiveCardViewColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    description,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmi,
                    style: TextStyle(
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    comment,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              width: double.infinity,
              height: 50.0,
              color: kBottomContainerColor,
            ),
          )
        ],
      ),
    );
  }
}
