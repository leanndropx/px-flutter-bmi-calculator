import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String result = 'Enter your weight and height into the fields to calculate BMI';
  late double bmi;
  late double weight;
  late double height;
  String weightError = '';
  String heightError = '';

  double weightToPlus = 0;
  double weightToLose = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: resetController,
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.person_outline,
                size: 120,
                color: Colors.green,
              ),
              TextFormField(
                controller: weightController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.green),
                decoration: const InputDecoration(
                    labelText: 'WEIGHT (Kg)',
                    labelStyle: TextStyle(color: Colors.green)),
                validator: (value){
                  if(value != null && value.isEmpty){
                    return "Enter your Weight";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: heightController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.green),
                decoration: const InputDecoration(
                    labelText: 'HEIGHT (Cm)',
                    labelStyle: TextStyle(color: Colors.green)),
                validator: (value){
                  if(value != null && value.isEmpty){
                    return "Enter your Height";
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 20),
                child: Container(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        calculatesBMI();
                      }
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: const Text(
                      'Calculate',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              Text(
                '${result}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 18
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void resetController(){
    weightController.text = "";
    heightController.text = "";
    setState(() {
      result = 'Enter your weight and height into the fields to calculate BMI';
    });
  }

  void calculatesBMI(){
    setState(() {
      weight = double.parse(weightController.text);
      height = double.parse(heightController.text) / 100;
      bmi = weight / (height * height);

      if(bmi < 18.6){
        howManyKilosMissesForIdealWeight();
        result = 'Weight down: ${bmi.toStringAsPrecision(4)}. Gain ${weightToPlus.toStringAsPrecision(3)} Kg to reach your ideal weight.';
      } else if (bmi >= 18.6 && bmi < 24.9) {
        result = 'Ideal weight: ${bmi.toStringAsPrecision(4)}';
      } else if (bmi >= 24.9 && bmi < 29.9){
        howManyKilosMissesForIdealWeight();
        result = 'Slightly overweight: ${bmi.toStringAsPrecision(4)}. Lose ${weightToLose.toStringAsPrecision(3)} Kg to reach your ideal weight';
      }else if (bmi >=29.9 && bmi < 34.9){
        howManyKilosMissesForIdealWeight();
        result = 'Grau obesity I: ${bmi.toStringAsPrecision(4)}. Lose ${weightToLose.toStringAsPrecision(4)} Kg to reach your ideal weight';
      }else if (bmi >=34.9 && bmi < 39.9){
        howManyKilosMissesForIdealWeight();
        result = 'Grau obesity II: ${bmi.toStringAsPrecision(4)}. Lose ${weightToLose.toStringAsPrecision(4)} Kg to reach your ideal weight';
      }else if (bmi >=40){
        howManyKilosMissesForIdealWeight();
        result = 'Grau obesity III: ${bmi.toStringAsPrecision(4)}. Lose ${weightToLose.toStringAsPrecision(4)} Kg to reach your ideal weight';
      }
    });
  }

  void howManyKilosMissesForIdealWeight(){
    double idealMax = 24.9;
    double idealMin = 18.6;
    setState(() {
      if(bmi > idealMax){
        weightToLose = (((idealMax*weight)/bmi)-weight)*-1;
      } else if (bmi < idealMin){
        weightToPlus = ((idealMin*weight)/bmi)-weight;
      }
    });
  }

}
