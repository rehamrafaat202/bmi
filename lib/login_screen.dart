// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'shared/shared_component.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisible = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "LogIn",
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              // ignore: prefer_const_constructors
              defaultTextField(
                  type: TextInputType.emailAddress,
                  emailController: emailController,
                  suffed: () {
                    setState(() {});
                  },
                  email: "Email",
                  preicn: Icons.email),
              SizedBox(
                height: 20,
              ),
              defaultTextField(
                  type: TextInputType.number,
                  emailController: passwordController,
                  haveSuf: true,
                  suffed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  isvisible: isVisible,
                  email: "Password",
                  preicn: Icons.local_activity),

              SizedBox(
                height: 30,
              ),
              // TextFormField(
              //   obscureText: isVisible,
              //   controller: passwordController,
              //   decoration: InputDecoration(
              //       border: OutlineInputBorder(),
              //       prefixIcon: Icon(Icons.lock),
              //       suffixIcon: IconButton(
              //           onPressed: () {
              //             setState(() {
              //               isVisible = !isVisible;
              //             });
              //           },
              //           icon: Icon(Icons.remove_red_eye))),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return "please add password";
              //     }
              //     return null;
              //   },
              // ),
              // SizedBox(
              //   height: 30,
              // ),
              Container(
                width: double.infinity,
                height: 40,
                color: Colors.teal,
                child: MaterialButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print(passwordController.text);
                    }
                  },
                  child: Text("LogIn"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
