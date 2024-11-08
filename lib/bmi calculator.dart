import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomePage();
  }
}

class HomePage extends State<MyHomePage>{

  TextEditingController weightController = TextEditingController();
  TextEditingController htfeetsController = TextEditingController();
  TextEditingController htinchesController = TextEditingController();

  String bmi = '';
  Color bgColor = Colors.transparent;
  String bmiCateg = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI Calculator")),
        
      ),
      body:
      SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [


          Image(image: AssetImage('assets/image/bmi_pic.png')),
          Stack(
            children: [
              Container(margin: EdgeInsets.symmetric(vertical: 12),
                width: double.infinity,
                height: 250 ,

                child:
                Image(image: AssetImage('assets/image/white_heart.png'),fit: BoxFit.fill,),
              ),
              Container(
                height: 230,
                width: double.infinity,


                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( bmi,
                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: bgColor),),
                    Text(bmiCateg,
                      style: TextStyle(
                          fontSize: 18,
                          color: bgColor,
                          fontWeight: FontWeight.w500
                      ),)
                  ],
                ),
              )
            ],
          ),


          Container(margin: EdgeInsets.all(15),
            width: 180,
            child: TextField(controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Enter Weight in kg',
                  label: Text('Weight(in kg)'),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.green,
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(
                      )
                  )
              ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey,
            ),
          ),

          Row(
            children: [
              Expanded(
                child: Container(margin: EdgeInsets.all(15),
                  child: TextField(
                    controller: htfeetsController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "height in feets",
                        label: Text('Height(in feets)'),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.green,
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                            )
                        )
                    ),
                  ),
                ),
              ),
              Container(
                height: 90,
                width: 1,
                color: Colors.grey,
              ),
              Expanded(
                child: Container(margin: EdgeInsets.all(15),
                  child: TextField(controller: htinchesController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'height in inches',
                        label: Text('Height(in inches)'),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.green,
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                            )
                        )
                    ),),
                ),
              ),

            ],
          ),

          ElevatedButton(onPressed: (){
            num weight = double.parse(weightController.text);
            num htFeets = double.parse(htfeetsController.text);
            num htInches = double.parse(htinchesController.text);

            num totalInches = (htFeets*12) + htInches;

            num totalCm = totalInches * 2.54;

            num totalM = totalCm/100;

            num bmiValue = weight/(pow(totalM, 2.0));

            bmi = "BMI is : ${bmiValue.toStringAsFixed(2)}";
            
            /// Bmi and Color Logic
            
            if(bmiValue < 18.5){
              bgColor = Color(0xff43bbb0);
              bmiCateg = "Underweight";
            }else if(bmiValue >= 18.5 && bmiValue <24.9){
              bgColor = Color(0xff57b65b);
              bmiCateg = "Normal";
            }else if(bmiValue >= 24.9 && bmiValue < 29.9){
              bgColor = Color(0xffeac11f);
              bmiCateg = "Overweight";
            }else if(bmiValue >= 29.9 && bmiValue < 34.9){
              bgColor = Color(0xfffe9544);
              bmiCateg = "Obese";
            }else if(bmiValue > 34.9){
              bgColor = Colors.red.shade900;
              bmiCateg = "Extremely Obese";
            };
            
            setState(() {

            });
          }, child: Text('Calculate BMI',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.white),),
            style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
              shadowColor: Colors.black,elevation: 5
          ),),
          Container(
            width: double.infinity,
            height: 50,
            child: Text('',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),),
          )


        ],
            ),
      ),
    );
  }
}