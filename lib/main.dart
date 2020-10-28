import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Lean Body Mass Calculator';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: Padding(padding: EdgeInsets.all(15),
            child: MyStatefulWidget(),)
        ),
      ),
    );
  }
}

enum Gender { male, female }
enum Age { yes, no }

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  double boer;
  double james;
  double hume;
  double lbm ;
  double ecv;
  double bmi;
  double bodyfat;
  double bpercent;
  double jpercent;
  double hpercent;
  double jlbm;
  double bf;
  double jbf;
  double bbf;
  double hbf;
  Gender gender = Gender.male;
  Age age = Age.yes;
  double height;
  double weight;
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  double iconSize = 40;
  _MyStatefulWidgetState({this.weight,this.height});

  void calculate() {
    height = double.parse(textEditingController.text);
    lbm=0.0;
    bmi = (weight/height/height)*10000;

    if(gender == Gender.male && age == Age.no){
      boer = 0.267*height + 0.407*weight - 19.2;
      bpercent = (boer/weight)*100;
      bbf = 100-bpercent;
      james = 1.1*weight - 128*pow(weight/height,2);
      jpercent = (james/weight)*100;
      jbf = 100-jpercent;
      hume = 0.32810*weight + 0.33929*height - 29.5336;
      hpercent = (hume/weight)*100;
      hbf = 100-hpercent;
    } else if(gender == Gender.male && age == Age.yes){
      ecv = 0.0215*pow(weight,0.6469)*pow(height, 0.7236);
      lbm = 3.8*ecv;
      jlbm = (lbm/weight)*100;
      bf = 100 - jlbm;
      boer = 0.267*height + 0.407*weight - 19.2;
      bpercent = (boer/weight)*100;
      bbf = 100-bpercent;
      james = 1.1*weight - 128*pow(weight/height,2);
      jpercent = (james/weight)*100;
      jbf = 100-jpercent;
      hume = 0.32810*weight + 0.33929*height - 29.5336;
      hpercent = (hume/weight)*100;
      hbf = 100-hpercent;
    } else if(gender == Gender.female && age == Age.yes){
      ecv = 0.0215*pow(weight,0.6469)*pow(height, 0.7236);
      lbm = 3.8*ecv;
      jlbm = (lbm/weight)*100;
      bf = 100 - jlbm;
      boer = 0.473*height + 0.252*weight - 48.3;
      bpercent = (boer/weight)*100;
      bbf = 100-bpercent;
      james = 1.07*weight - 148*pow(weight/height,2);
      jpercent = (james/weight)*100;
      jbf = 100-jpercent;
      hume = 0.29569*weight + 0.41813*height - 43.2933;
      hpercent = (hume/weight)*100;
      hbf = 100-hpercent;
    } else if(gender == Gender.female && age == Age.no) {
      boer = 0.473*height + 0.252*weight - 48.3;
      bpercent = (boer/weight)*100;
      bbf = 100-bpercent;
      james = 1.07*weight - 148*pow(weight/height,2);
      jpercent = (james/weight)*100;
      jbf = 100-jpercent;
      hume = 0.29569*weight + 0.41813*height - 43.2933;
      hpercent = (hume/weight)*100;
      hbf = 100-hpercent;
    }
  }

  void reset(){
    setState(() {
      height = null;
      weight = null;
      textEditingController.text = "";
      textEditingController2.text = "";
    });
  }

  Widget build(BuildContext context) {
    return Column(

        children: [Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Gender:"),
              Radio(value: Gender.male,
                  groupValue: gender,
                  onChanged: (Gender value) {
                    setState(() {
                      gender = value;
                    });
                  }),
              Text('Male'),
              Radio(value: Gender.female,
                  groupValue: gender,
                  onChanged: (Gender value) {
                    setState(() {
                      gender = value;
                    });
                  }),
              Text('Female'),
            ]
        ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Age 14 or younger?"),
                Radio(value: Age.yes, groupValue: age, onChanged: (Age value) {
                  setState(() {
                    age = value;
                  });
                }),
                Text('Yes'),
                Radio(value: Age.no, groupValue: age, onChanged: (Age value) {
                  setState(() {
                    age = value;
                  });
                }),
                Text('No'),
              ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 300,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: textEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Height',
                        hintText: 'Enter Height in centimeter Here',
                      ),
                      autofocus: false,
                    )
                ),

              ]
          ),
          new Container(
            height: 8.0,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 300,
                    child: TextField(
                      controller: textEditingController2,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Weight',
                        hintText: 'Enter Weight in kilogram Here',
                      ),
                      autofocus: false,
                    )
                )
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Calculate'),
                      onPressed: (){
                        setState(() {
                          height = double.parse(textEditingController.text);
                          weight = double.parse(textEditingController2.text);
                          calculate();
                        });
                      },
                    )
                ),
                new Container(
                  width: 8.0,
                ),
                Container(
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Reset'),
                      onPressed: () {
                        reset();
                      },
                    )
                ),
              ]),
          if(weight != null)
          Row(children: <Widget>[Table(
            defaultColumnWidth: FixedColumnWidth(127),
            border: TableBorder.all(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 2),
            children: [
              TableRow( children: [
                Column(children:[Text('Formula', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold))]),
                Column(children:[Text('Lean Body Mass', style: TextStyle(fontSize: 15.0,  fontWeight: FontWeight.bold))]),
                Column(children:[Text('Body Fat', style: TextStyle(fontSize: 15.0,  fontWeight: FontWeight.bold))]),
              ]),
              if(age == Age.yes)
                TableRow( children: [
                  Column(children:[Text('Peters(for Children)')]),
                  Column(children:[Text(lbm.toStringAsFixed(1)+"("+(jlbm).toStringAsFixed(0)+"%)")]),
                  Column(children:[Text(bf.toStringAsFixed(0)+"%")]),
                ]),
              TableRow( children: [
                Column(children:[Text('Boer')]),
                Column(children:[Text(boer.toStringAsFixed(1)+"("+(bpercent).toStringAsFixed(0)+"%)")]),
                Column(children:[Text(bbf.toStringAsFixed(0)+"%")]),
              ]),
              TableRow( children: [
                Column(children:[Text('James')]),
                Column(children:[Text(james.toStringAsFixed(1)+"("+(jpercent).toStringAsFixed(0)+"%)")]),
                Column(children:[Text(jbf.toStringAsFixed(0)+"%")]),
              ]),
              TableRow( children: [
                Column(children:[Text('Hume')]),
                Column(children:[Text(hume.toStringAsFixed(1)+"("+(hpercent).toStringAsFixed(0)+"%)")]),
                Column(children:[Text(hbf.toStringAsFixed(0)+"%")]),
              ]),
            ],
          ),
          ]
          ),
        ]);
  }
}