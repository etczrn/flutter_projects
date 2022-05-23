import 'package:flutter/material.dart';
import 'package:global_fitness/shared/menu_bottom.dart';
import 'package:global_fitness/shared/menu_drawer.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  final double fontSize = 18;
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? height; // ? means nullable
  double? weight;
  late List<bool> isSelected;
  String heightMessage = '';
  String weightMessage = '';

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage =
        'Please insert your height in ' + ((isMetric) ? 'meters' : 'inches');
    weightMessage =
        'Please insert your height in ' + ((isMetric) ? 'kilos' : 'pounds');
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      bottomNavigationBar: MenuBottom(),
      drawer: MenuDrawer(),
      body: Column(
        children: [
          ToggleButtons(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Metric', style: TextStyle(fontSize: fontSize))),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child:
                      Text('Imperial', style: TextStyle(fontSize: fontSize))),
            ],
            isSelected: isSelected,
            onPressed: toggleMeasure,
          ),
          TextField(
            controller: txtHeight,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: heightMessage),
          ),
          TextField(
            controller: txtWeight,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: weightMessage),
          ),
          ElevatedButton(
              onPressed: () {},
              child:
                  Text('Calculate BMI', style: TextStyle(fontSize: fontSize))),
          Text(result, style: TextStyle(fontSize: fontSize)),
        ],
      ),
    );
  }

  void toggleMeasure(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }
}
