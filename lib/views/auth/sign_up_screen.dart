import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/data/network/http_exception.dart';
import '/data/models/user.dart';
import '/data/network/data_response.dart';
import '/data/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import '/views/auth/sign_in_screen.dart';
import '/views/home/home_screen.dart';
import '/views/shared/assets_variables.dart';
import '/views/shared/button_widget.dart';
import '/views/shared/shared_components.dart';
import '/views/shared/shared_values.dart';
import '/views/shared/text_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController studentNumber;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    studentNumber = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    studentNumber.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SharedComponents.appBar("Sign up"),
          Expanded(
              child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: SharedValues.padding * 2),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Sign up",
                      style: Theme.of(context).textTheme.headline1,
                    )),
                const SizedBox(height: SharedValues.padding * 2),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 1.5)),
                  child: SvgPicture.asset(AssetsVariable.user,
                      fit: BoxFit.scaleDown),
                ),
                const SizedBox(height: SharedValues.padding * 2),
                Padding(
                  padding: const EdgeInsets.all(SharedValues.padding),
                  child: TextFieldWidget(
                      controller: studentNumber,
                      hintText: "Id Number",
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          return null;
                        }
                        return "This field is required";
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(SharedValues.padding),
                  child: TextFieldWidget(
                      controller: email,
                      hintText: "Email",
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          return null;
                        }
                        return "This field is required";
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(SharedValues.padding),
                  child: TextFieldWidget(
                      controller: phone,
                      hintText: "Phone",
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          return null;
                        }
                        return "This field is required";
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(SharedValues.padding),
                  child: TextFieldWidget(
                    controller: password,
                    hintText: "Password",
                    textInputAction: TextInputAction.none,
                    obscureText: true,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      }
                      return "This field is required";
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(SharedValues.padding),
                  child: TextFieldWidget(
                    controller: confirmPassword,
                    hintText: "Confirm Password",
                    textInputAction: TextInputAction.none,
                    obscureText: true,
                    validator: (value) {
                      if(value == null||value.isEmpty){
                        return "This field is required";
                      }
                      else if (confirmPassword.text == password.text) {
                        return null;
                      }
                      return "كلمة المرور غير متطابقة";
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(SharedValues.padding),
                  child: ButtonWidget(
                    minWidth: double.infinity,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Result result = await Provider.of<AuthProvider>(context,
                                listen: false)
                            .signUp(User(
                                id: DateTime.now().millisecondsSinceEpoch,
                                studentNumber: int.parse(studentNumber.text),
                                email: email.text,
                                phone: phone.text,
                                password: password.text));
                        if (result is Error&&result.exception is ExistUserException){
                          // ignore: use_build_context_synchronously
                          SharedComponents.showSnackBar(context, "This account already exists. please log in");
                        }
                        else if (result is Success) {
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        }
                      }
                    },
                    child: Text(
                      "Sign up",
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(SharedValues.padding),
                  child: Row(
                    children: [
                      Text("I already have an account",
                          style: Theme.of(context).textTheme.bodyText2),
                      ButtonWidget(
                        withBorder: false,
                        minWidth: 80,
                        height: 40,
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInScreen()));
                        },
                        child: Text("Sign in?",
                            style: Theme.of(context).textTheme.button),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
