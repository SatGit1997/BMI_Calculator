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
  TextEditingController heightController = TextEditingController();

  String result = '';
  String result1 = '';


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
          Stack(
            children: [
              Container(margin: EdgeInsets.symmetric(vertical: 12),
                width: double.infinity,
                height: 250 ,

                child:
                Image(image: AssetImage('assets/image/bg_heart_img.png'),fit: BoxFit.fitHeight,),
              ),
              Container(
                height: 250,
                width: double.infinity,


                child: Center(
                  child: Text( result,
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),),
                ),
              )
            ],
          ),

          Image(image: AssetImage('assets/image/bmi_pic.png')),


          Container(
            width: double.infinity,
            height: 50,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Weight',style: TextStyle(fontSize: 20,color: Colors.grey),),
                Text('Height',style: TextStyle(fontSize: 20,color: Colors.grey)),

              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(margin: EdgeInsets.all(15),
                  child: TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Enter weight in kg",
                        label: Text('Weight'),
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
                height: 50,
                width: 1,
                color: Colors.grey,
              ),
              Expanded(
                child: Container(margin: EdgeInsets.all(15),
                  child: TextField(controller: heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                    hintText: 'Enter height in cm',
                      label: Text('Height'),
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
              int weight = int.parse(weightController.text);
              int height = int.parse(heightController.text);

              if( height>0){
                int bmi = weight * 10000 ~/ (height * height);



                if (bmi < 18.5) {
                  result = '${bmi.toStringAsFixed(2)}';

                } else if (bmi >= 18.5 && bmi < 24.9) {
                  result = '${bmi.toStringAsFixed(2)}';
                } else if (bmi >= 25 && bmi < 29.9) {
                  result = '${bmi.toStringAsFixed(2)}';
                } else {
                  result = '${bmi.toStringAsFixed(2)}';
                }
                setState(() {

                });


              }

            },
              child: Text('Calculate BMI',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green
              ),

            ),
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