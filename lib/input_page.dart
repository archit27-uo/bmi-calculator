

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const cardColor = 0xFF1D1E33;
const bottomContainerHeight = 80.0;
const bottomContainerColor = 0xFFEB1555;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
int currentHeightValue = 180;
int currentWeight = 60;
int currentAge=20;
enum GenderValue{
  male,
  female,
  none,
}
GenderValue selectedGender=GenderValue.none;

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  // void updateCardColor (GenderValue gen){
  //   gen==GenderValue.male?maleCardColor=activeCardColor:maleCardColor=inactiveCardColor;
  //   if(gen==GenderValue.male){
  //     if(maleCardColor==inactiveCardColor){
  //       maleCardColor=activeCardColor;
  //       femaleCardColor=inactiveCardColor;
  //     }
  //     else{
  //       maleCardColor=inactiveCardColor;
  //     }
  //   }
  //   else if(gen==GenderValue.female){
  //     if(femaleCardColor==inactiveCardColor){
  //       femaleCardColor=activeCardColor;
  //       maleCardColor=inactiveCardColor;
  //     }
  //     else{
  //       femaleCardColor=inactiveCardColor;
  //     }
  //   }
  // }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                       // updateCardColor(GenderValue.male);
                        selectedGender=GenderValue.male;
                      });
                    },
                    child: Card(colour: selectedGender==GenderValue.male?activeCardColor:inactiveCardColor, cardContent: Gender("MALE", FontAwesomeIcons.mars),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //updateCardColor(GenderValue.female);
                        selectedGender=GenderValue.female;
                      });
                    },
                      child: Card(colour: selectedGender==GenderValue.female?activeCardColor:inactiveCardColor, cardContent:Gender("FEMALE", FontAwesomeIcons.venus),)),
                ),
              ],
            ),
          ),
          Expanded(child: Card(colour: Color(cardColor), cardContent: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "HEIGHT",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                    color: Color(0xFF8D8E98)
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                      currentHeightValue.toString(),
                  style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
              ),
                  ),
                  Text(
                    "cm",
                      style: TextStyle(

                      fontSize: 20.0,
                      color: Color(0xFF8D8E98),
                  )
                  ),
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  thumbColor: Color(bottomContainerColor),
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Color(0xFF8D8E98),
                  overlayColor: Color(0x29EB1555),
                ),

                child: Slider(

                    value: currentHeightValue.toDouble(),
                    min: 120,
                    max: 220,

                    onChanged: (double newValue){
                      setState(() {
                        currentHeightValue = newValue.round();
                      });
                    }),
              )
            ],
          ),),
          ),
          Expanded(child: Row(

            children: [

              Expanded(

                child: Card( colour: Color(cardColor), cardContent: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(

                        "WEIGHT",
                style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 24,
                color: Color(0xFF8D8E98)
          ),
                    ),
                    Text(
                        currentWeight.toString(),
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundButton(FontAwesomeIcons.minus,(){
                          setState(() {
                            currentWeight--;
                          });

                        }),
                        SizedBox(
                          width: 15.0,
                        ),
                        RoundButton(FontAwesomeIcons.plus, (){
                          setState(() {
                            currentWeight++;
                          });
                        }),
                      ],
                    )

                  ],
                ),),
              ),
              Expanded(
                  child:Card(colour: Color(cardColor), cardContent: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(

                        "AGE",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 24,
                            color: Color(0xFF8D8E98)
                        ),
                      ),
                      Text(
                        currentAge.toString(),
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundButton(FontAwesomeIcons.minus,(){
                            setState(() {
                              currentAge--;
                            });

                          }),
                          SizedBox(
                            width: 15.0,
                          ),
                          RoundButton(FontAwesomeIcons.plus, (){
                            setState(() {
                              currentAge++;
                            });
                          }),
                        ],
                      )

                    ],
                  ),
              ),
              ),
            ],
          ),),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(
                context, '/result'),
            },
            child: Container(
              child: Center(
                child: Text(
                  "CALCULATE",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              color: Color(bottomContainerColor),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            ),
          )
        ],
      )
    );
  }
}


class RoundButton extends StatelessWidget {

  RoundButton(this.icon, this.onPressed){

  }
  final IconData icon;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(

        onPressed: onPressed,
      child: Icon(icon),
      elevation: 1.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints:BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),

    );
  }
}


class Gender extends StatelessWidget {
  Gender(this.genderText, this.genderIcon);

  final String genderText;
  final IconData genderIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 60.0,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
            genderText,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98)
          ),
        ),
      ],
    );
  }
}

class Card extends StatelessWidget {
 //const Card({Key? key, required this.colour, required this.cardContent}): super(key: key);
  Card({required this.colour,this.cardContent});

  //Card({Key? key, required this.colour}) : super(key: key);
  final Color colour;
 Widget? cardContent;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardContent,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}
