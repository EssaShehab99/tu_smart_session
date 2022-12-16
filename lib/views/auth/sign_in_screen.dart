import 'package:flutter/material.dart';
import '/views/auth/sign_up_screen.dart';
import '/views/home/home_screen.dart';
import '/views/shared/button_widget.dart';
import '/views/shared/shared_components.dart';
import '/views/shared/shared_values.dart';
import '/views/shared/text_field_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              SharedComponents.appBar("Sign in"),
              Expanded(child: ListView(
                children: [
                  const SizedBox(height: SharedValues.padding*2),
                  Align(
                      alignment: Alignment.center,
                      child: Text("Sign in",style: Theme.of(context).textTheme.headline1,)),
                  const SizedBox(height: SharedValues.padding*10),
                  Padding(
                    padding: const EdgeInsets.all(SharedValues.padding),
                    child: TextFieldWidget(controller: TextEditingController(),hintText: "Id Number"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(SharedValues.padding),
                    child: TextFieldWidget(controller: TextEditingController(),hintText: "Password"),
                  ),
                  const SizedBox(height: SharedValues.padding*5),
                  Padding(
                    padding: const EdgeInsets.all(SharedValues.padding),
                    child: ButtonWidget(
                      minWidth: double.infinity,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                      },
                      child: Text(
                        "Sign in",
                        style: Theme.of(context).textTheme.button,
                      ),),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                          },
                          child: Text("Sign up?",
                              style: Theme.of(context).textTheme.button),
                        )
                      ],),
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}
