import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'resuabe_card.dart';
import 'constraints.dart';
import 'results_page.dart';
import 'Calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ResusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? activeColour
                          : inactiveColour,
                      cardChild: ReusableIcon(
                        icon: FontAwesomeIcons.mars,
                        text: "Male",
                      ),
                    ),
                  ),
                  Expanded(
                    child: ResusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? activeColour
                          : inactiveColour,
                      cardChild: ReusableIcon(
                        icon: FontAwesomeIcons.venus,
                        text: "Female",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ResusableCard(
                colour: activeColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "HEIGHT",
                      style: labelTextStyle,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(
                            kheight.toString(),
                            style: numberHieght,
                          ),
                          Text(
                            'cm',
                            style: labelTextStyle,
                          ),
                        ],
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                      ),
                      child: Slider(
                        value: kheight.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            kheight = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ResusableCard(
                      colour: activeColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: labelTextStyle,
                          ),
                          Text(
                            kweight.toString(),
                            style: numberHieght,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(Icon(FontAwesomeIcons.minus),
                                    () {
                                  setState(() {
                                    kweight--;
                                  });
                                }),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(Icon(FontAwesomeIcons.plus),
                                    () {
                                  setState(() {
                                    kweight++;
                                  });
                                })
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ResusableCard(
                      colour: activeColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age",
                            style: labelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: numberHieght,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(Icon(FontAwesomeIcons.minus),
                                    () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(Icon(FontAwesomeIcons.plus),
                                    () {
                                  setState(() {
                                    age++;
                                  });
                                })
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonText: "Calculate",
              ontap: () {
                CalculatorBrain ob =
                    CalculatorBrain(height: kheight, weight: kweight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmiResult: ob.calculateBrain(),
                              interpretation: ob.getInterpretation(),
                              resultText: ob.getResult(),
                            )));
              },
            )
          ],
        ));
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({this.buttonText, this.ontap});
  final String buttonText;
  final Function ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
            child: Text(
          buttonText,
          style: calculateStyle,
        )),
        color: bottomContainerColour,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: bottomHieghtContainer,
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.child, this.onPressed);
  final Function onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      child: child,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Color(0xFF4C4F5E),
      elevation: 6,
      onPressed: onPressed,
    );
  }
}
