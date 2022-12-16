import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/views/auth/sign_in_screen.dart';
import '/views/home/home_screen.dart';
import '/views/shared/assets_variables.dart';
import '/views/shared/button_widget.dart';
import '/views/shared/shared_components.dart';
import '/views/shared/shared_values.dart';
import '/views/shared/text_field_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              SharedComponents.appBar("Sign up"),
              Expanded(child: ListView(
                children: [
                  const SizedBox(height: SharedValues.padding*2),
                  Align(
                      alignment: Alignment.center,
                      child: Text("Sign up",style: Theme.of(context).textTheme.headline1,)),
                  const SizedBox(height: SharedValues.padding*2),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Theme.of(context).primaryColor,width: 1.5)
                    ),
                    child: SvgPicture.asset(AssetsVariable.user,
                        fit: BoxFit.scaleDown),
                  ),
                  const SizedBox(height: SharedValues.padding*2),
                  Padding(
                    padding: const EdgeInsets.all(SharedValues.padding),
                    child: TextFieldWidget(controller: TextEditingController(),hintText: "Id Number"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(SharedValues.padding),
                    child: TextFieldWidget(controller: TextEditingController(),hintText: "Email"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(SharedValues.padding),
                    child: TextFieldWidget(controller: TextEditingController(),hintText: "Phone"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(SharedValues.padding),
                    child: TextFieldWidget(controller: TextEditingController(),hintText: "Password"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(SharedValues.padding),
                    child: TextFieldWidget(controller: TextEditingController(),hintText: "Confirm Password"),
                  ),
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
                        Text("I already have an account",
                            style: Theme.of(context).textTheme.bodyText2),
                        ButtonWidget(
                          withBorder: false,
                          minWidth: 80,
                          height: 40,
                          onPressed: () async{
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
                          },
                          child: Text("Sign in?",
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
