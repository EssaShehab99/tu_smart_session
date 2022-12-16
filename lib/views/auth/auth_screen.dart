import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/views/auth/sign_in_screen.dart';
import '/views/auth/sign_up_screen.dart';
import '/views/shared/assets_variables.dart';
import '/views/shared/button_widget.dart';
import '/views/shared/shared_components.dart';
import '/views/shared/shared_values.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Column(
            children: [
              SharedComponents.appBar("TV Smart Session",withBackBtn: false),
              Expanded(
                  child: SizedBox(
                height: 200,
                child: SvgPicture.asset(AssetsVariable.universityLogo),
              )),
            ],
          )),
          Expanded(
              child: Column(
            children: [
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.all(SharedValues.padding),
                child: ButtonWidget(
                  minWidth: double.infinity,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ));
                  },
                  child: Text(
                    "Sign in",
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              )),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.all(SharedValues.padding),
                child: ButtonWidget(
                  minWidth: double.infinity,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ));
                  },
                  child: Text(
                    "Sign up",
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              )),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.all(SharedValues.padding),
                child: ButtonWidget(
                  minWidth: double.infinity,
                  onPressed: () {},
                  child: Text(
                    "Continue as a guest",
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              )),
            ],
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {}, child: SvgPicture.asset(AssetsVariable.info)),
    ));
  }
}
