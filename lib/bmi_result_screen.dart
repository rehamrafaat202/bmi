import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  final bool ismale;
  final double res;
  final int age;
  const BmiResultScreen(
      {required this.ismale, required this.res, required this.age, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("The tesult"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Gender is : $ismale"),
          Text("Result is : $res"),
          Text("Age is : $age"),
        ],
      ),
    );
  }
}
