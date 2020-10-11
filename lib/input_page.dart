import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CardView.dart';
import 'CardContent.dart';
import 'Constants.dart';
import 'results_page.dart';
import 'bmi_brain.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Color maleCardColor = kInactiveCardViewColor;
Color femaleCardColor = kInactiveCardViewColor;
Gender selectedGender;
int height = 180;
int weight = 67;
int age = 18;

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CardView(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    color: selectedGender == Gender.Male
                        ? kActiveCardViewColor
                        : kInactiveCardViewColor,
                    cardChild:
                        CardContent(icon: FontAwesomeIcons.mars, text: 'MALE'),
                  ),
                ),
                Expanded(
                  child: CardView(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                    color: selectedGender == Gender.Female
                        ? kActiveCardViewColor
                        : kInactiveCardViewColor,
                    cardChild: CardContent(
                        icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CardView(
              color: kActiveCardViewColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kBigTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CardView(
                    color: kActiveCardViewColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kBigTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundButton(
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CardView(
                    color: kActiveCardViewColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBigTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundButton(
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain brain =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultsPage(
                  bmi: brain.BmiCalculator(),
                  description: brain.BmiDescription(),
                  comment: brain.BmiComment(),
                );
              }));
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
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

class RoundButton extends StatelessWidget {
  RoundButton({this.icon, this.onPress});

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Color(0xFF4C4F5E),
      child: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: onPress,
      elevation: 4,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.9),
    );
  }
}
