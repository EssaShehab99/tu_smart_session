import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tu_smart_session/views/auth/forget_password.dart';
import '/data/network/data_response.dart';
import '/data/providers/auth_provider.dart';
import '/views/auth/sign_up_screen.dart';
import '/views/home/home_screen.dart';
import '/views/shared/button_widget.dart';
import '/views/shared/shared_components.dart';
import '/views/shared/shared_values.dart';
import '/views/shared/text_field_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController studentNumber;
  late TextEditingController password;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    studentNumber = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    studentNumber.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SharedComponents.appBar("Sign in"),
          Expanded(
              child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: SharedValues.padding * 2),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Sign in",
                      style: Theme.of(context).textTheme.headline1,
                    )),
                const SizedBox(height: SharedValues.padding * 10),
                Padding(
                  padding: const EdgeInsets.all(SharedValues.padding),
                  child: TextFieldWidget(
                      controller: studentNumber,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          return null;
                        }
                        return "This field is required";
                      },
                      textInputAction: TextInputAction.next,
                      hintText: "Id Number"),
                ),
                Padding(
                  padding: const EdgeInsets.all(SharedValues.padding),
                  child: TextFieldWidget(
                    controller: password,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      }
                      return "This field is required";
                    },
                    hintText: "Password",
                    textInputAction: TextInputAction.done,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: SharedValues.padding),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgetPassword()));
                      },
                      child: Text("Forget password?",
                          style: Theme.of(context).textTheme.button),
                    ),
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
                            .signIn(int.tryParse(studentNumber.text) ?? 0,
                                password.text);
                        if (result is Success) {
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        } else if (result is Error) {
                          // ignore: use_build_context_synchronously
                          SharedComponents.showSnackBar(
                              context, "User or password incorrect !!",
                              backgroundColor:
                                  // ignore: use_build_context_synchronously
                                  Theme.of(context).colorScheme.error);
                        }
                      }
                    },
                    child: Text(
                      "Sign in",
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(SharedValues.padding),
                  child: Row(
                    children: [
                      Text("I don't have an account",
                          style: Theme.of(context).textTheme.bodyText2),
                      ButtonWidget(
                        withBorder: false,
                        minWidth: 80,
                        height: 40,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: Text("Sign up?",
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
