import 'dart:math';

import 'package:flutter/material.dart';
import 'bmi_result_screen.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;
  double height = 120;
  int age = 0;
  int weight = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("BMI Calculator")),
        body: Column(
          children: [
            Expanded(
                child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: isMale ? Colors.blue : Colors.grey[300],
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.ac_unit,
                                size: 70,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "male",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: isMale ? Colors.grey[300] : Colors.blue,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.ac_unit,
                                size: 70,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Female",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
            Expanded(
                child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Height",
                      style: TextStyle(
                        fontSize: 25,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.round().toString(),
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      Text("CM",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Slider(
                      value: height,
                      max: 220,
                      min: 80,
                      onChanged: (val) {
                        setState(() {
                          height = val;
                        });
                        print(height.round());
                      })
                ],
              ),
            )),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Age",
                                style: TextStyle(
                                  fontSize: 25,
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(age.toString(),
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  heroTag: "age++",
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  mini: true,
                                  child: const Icon(Icons.add),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                FloatingActionButton(
                                  heroTag: "age--",
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  mini: true,
                                  child: const Icon(Icons.remove),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("WEIGHT",
                                style: TextStyle(
                                  fontSize: 25,
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(weight.toString(),
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  heroTag: "weight++",
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  mini: true,
                                  child: const Icon(Icons.add),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                FloatingActionButton(
                                  heroTag: "weight--",
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  mini: true,
                                  child: const Icon(Icons.remove),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
            )),
            Container(
              width: double.infinity,
              color: Colors.blue,
              child: MaterialButton(
                height: 50.0,
                onPressed: () {
                  double result = weight / pow(height / 100, 2).round();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BmiResultScreen(
                                ismale: isMale,
                                age: age,
                                res: result,
                              )));
                },
                child: const Text(
                  "Calculate",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ));
  }
}
