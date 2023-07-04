import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/widgets/custom_textfield.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Member details"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: (){},
              child: Text("Edit",style: TextStyle(fontSize: 20,color: Colors.blue),),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 10,
          ),
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage("assets/Frame4.png"),
            child: Stack(children: [
              Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.transparent,
                  child: Icon(Icons.edit),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WidgetEditTextField(textFieldHint: 'Full Name', textInputType: TextInputType.numberWithOptions(), controller: nameController, onSubmitField: (){},),
                WidgetEditTextField(textFieldHint: 'Email', textInputType: TextInputType.numberWithOptions(), controller: emailController, onSubmitField: (){},),
                WidgetEditTextField(textFieldHint: 'Mobile Number', textInputType: TextInputType.numberWithOptions(), controller: numberController, onSubmitField: (){},),


              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {

              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.blue.shade50)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.black),
                ),
              )),
        ]),
      ),
    );
  }
}
