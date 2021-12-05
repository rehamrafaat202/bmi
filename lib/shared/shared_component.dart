import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

Widget defaultTextField(
        {required TextEditingController emailController,
        required String email,
        bool haveSuf = false,
        required TextInputType type,
        bool isvisible = false,
        required final Function suffed,
        required IconData preicn}) =>
    TextFormField(
        obscureText: isvisible,
        controller: emailController,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: email,
          prefixIcon: Icon(preicn),
          suffixIcon: haveSuf
              ? IconButton(
                  onPressed: () {
                    suffed();
                  },
                  icon: Icon(Icons.remove_red_eye))
              : null,
          border: OutlineInputBorder(),
        ));
