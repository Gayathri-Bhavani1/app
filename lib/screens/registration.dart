import 'package:app/constants/fonts.dart';
import 'package:app/widgets/mybutton.dart';
import 'package:app/widgets/mytextformfield.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/datalist.dart';
import '../widgets/dropdwon.dart';
import 'home.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}
  TextEditingController name = TextEditingController();
  String? gender;

  TextEditingController email = TextEditingController();
  TextEditingController phno = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  final formKey = GlobalKey<FormState>();
class _RegistrationScreenState extends State<RegistrationScreen> {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registartion',
          style: FontStyles().h2(),
        ),
        centerTitle: true,
          backgroundColor :blueOn.withOpacity(.3),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            padding: const EdgeInsets.all(10),
            color: ash,
            child: Column(
              children: [
                MyTextFormField(
                  controller: name,
                  labelText: 'Full Name',
                  hintText: 'Enter Your Name',
                  bgcolor: white.withOpacity(.7),
                  size: size,
                  icon: Icons.person,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),
                MyTextFormField(
                  controller: email,
                  labelText: 'Email',
                  hintText: 'Enter Your Email-id',
                  icon: Icons.email_outlined,
                  bgcolor: white.withOpacity(.7),
                  size: size,
                  maxlines: 1,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " Please enter email";
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                MyTextFormField(
                  controller: phno,
                  labelText: 'Mobile Number',
                  hintText: 'Enter Your Mobile Number',
                  icon: Icons.mobile_friendly_outlined,
                  bgcolor: white.withOpacity(.7),
                  size: size,
                  isNumber: true,
                  number: 10,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Please enter your mobile number";
                    }
                    if (val.length != 10) {
                      return 'Mobile number should be 10 digits long';
                    }

                    return null;
                  },
                ),
                MyDropDown(
                  value: gender,
                  size: size,
                  itemsList: gendersel.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                      ),
                    );
                  }).toList(),
                  lableText: "Gender",
                  hintText: "Select your Gender",
                  selection: (val) {
                    setState(() {
                      gender = val;
                    });
                  },
                  onSaved: (val) {
                    setState(() {
                      gender = val;
                    });
                  },
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Please select your gender";
                    }
                    return null;
                  },
                  labelText: '',
                ),
                MyTextFormField(
                  controller: country,
                  labelText: 'Country',
                  hintText: 'Enter Your Country',
                  bgcolor: white.withOpacity(.7),
                  size: size,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Please enter your Country";
                    }
                    return null;
                  },
                ),
                MyTextFormField(
                  controller: state,
                  labelText: 'State',
                  hintText: 'Enter Your State',
                  bgcolor: white.withOpacity(.7),
                  size: size,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Please enter your State";
                    }
                    return null;
                  },
                ),
                MyTextFormField(
                  controller: city,
                  labelText: 'City',
                  hintText: 'Enter Your City',
                  bgcolor: white.withOpacity(.7),
                  size: size,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Please enter your City";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                    child: MyButtonRegular(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Home(),
                              ),
                            );
                          }
                        },
                        title: 'Submit',
                        color: blue,
                        size: size * .9)),
                const SizedBox(
                  height: 30,
                ),
                Center(
                    child: MyButtonRegular(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: 'Close',
                        color: grey,
                        size: size * .9)),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
