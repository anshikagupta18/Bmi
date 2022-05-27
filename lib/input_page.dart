import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'results.dart';
import 'bottom_button.dart';
import 'roundIcon_Button.dart';
import 'calculator_brain.dart';
import 'dart:math';


class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender{
  male,
  female
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male?
                        kActiveCardColor
                        : kInactiveCardColor,
                  cardChild: iconContent(
                    lable: 'MALE',
                    icon: FontAwesomeIcons.mars,
                  ),
                  ),
                ),

    //--------------------------------------------------------------------------------------------------------------------------------//

                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female? kActiveCardColor: kInactiveCardColor,
                    cardChild: iconContent(
                      lable: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),

    //----------------------------------------------------------------------------------------------------------------------------------//

          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('HEIGHT',
                          style: kLableTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(height.toString(),
                            style: kNumberTextStyle,
                            ),
                            Text('cm',
                            style: kNumberTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Color(0xFFFFFFFF),
                            inactiveTrackColor: Color(0xFF8f9094),
                            thumbColor: kBottomContainerColor,
                            overlayColor: Color(0x25f52544),
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                            ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 220,
                            inactiveColor: Color(0xFF8f9094),
                            onChanged: (double newValue){
                              setState((){
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ), onPress: () {  },
                  ),
                ),
              ],
            ),
          ),

    //------------------------------------------------------------------------------------------------------------------------------//

          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('WEIGHT',
                          style: kLableTextStyle,
                          ),
                          Text(weight.toString(),
                          style: kNumberTextStyle
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                  onpress: () {
                                  setState(() {
                                    weight--;
                                  }
                                  );
                                  },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onpress: () {
                                  setState(() {
                                    weight++;
                                  }
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ), onPress: () {  },
                  ),
                ),

   //---------------------------------------------------------------------------------------------------------------------------------//

                Expanded(
                  child: ReusableCard(
                      colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE',
                          style: kLableTextStyle,
                        ),
                        Text(age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                                onpress: (){
                                setState(() {
                                  age--;
                                }
                                );
                            },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                                onpress: (){
                                setState(() {
                                  age++;
                                }
                                );
                             },
                            ),
                          ],
                        )
                      ],
                    ), onPress: () {  },
                  ),
                ),
              ],
            ),
          ),

   //---------------------------------------------------------------------------------------------------------------------------------//

          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight, bmi: weight / pow(height / 100, 2));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScreen(
                           bmiResult: calc.BmiResult(),
                           interpretation: calc.BmiInterpretation(),
                           resultText: calc.BmiCalculator(),
                     ),
                    ),
                );
            },
          ),
        ],
      ),
    );
  }
}




