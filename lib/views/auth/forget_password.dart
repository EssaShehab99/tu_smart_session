import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tu_smart_session/data/models/user.dart';
import 'package:tu_smart_session/data/providers/auth_provider.dart';
import 'package:tu_smart_session/data/utils/utils.dart';
import 'package:tu_smart_session/views/auth/sign_in_screen.dart';
import 'package:tu_smart_session/views/auth/verify_otp.dart';
import 'package:tu_smart_session/views/shared/button_widget.dart';
import 'package:tu_smart_session/views/shared/shared_components.dart';
import 'package:tu_smart_session/views/shared/shared_values.dart';
import 'package:tu_smart_session/views/shared/text_field_widget.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late TextEditingController studentNumber;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    studentNumber = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    studentNumber.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SharedComponents.appBar("Forget Password"),
            Expanded(
                flex: 2,
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: const EdgeInsets.all(SharedValues.padding),
                    children: [
                      SizedBox(
                        height: 200,
                        child: Center(
                            child: Text("Forget Password",
                                style: Theme.of(context).textTheme.headline1)),
                      ),
                      const SizedBox(height: SharedValues.padding),
                      TextFieldWidget(
                          controller: studentNumber,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value != null && value.isNotEmpty) {
                              return null;
                            }
                            return "This field is required";
                          },
                          hintText: "Id Number"),
                      const SizedBox(height: SharedValues.padding),
                      TextFieldWidget(
                          validator: (value) {
                            if (value == null) {
                              return "This field is required";
                            } else if (!Utils.validateEmail(value)) {
                              return "Invalid email";
                            }
                            return null;
                          },
                          controller: emailController,
                          hintText: "Email"),
                      const SizedBox(height: SharedValues.padding),
                      TextFieldWidget(
                        controller: passwordController,
                        hintText: "Password",
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            return null;
                          }
                          return "This field is required";
                        },
                      ),
                      const SizedBox(height: SharedValues.padding),
                      TextFieldWidget(
                        controller: confirmPasswordController,
                        hintText: "Confirm Password",
                        textInputAction: TextInputAction.none,
                        obscureText: true,
                        validator: (value) {
                          if(value == null||value.isEmpty){
                            return "This field is required";
                          }
                          else if (confirmPasswordController.text ==
                              passwordController.text) {
                            return null;
                          }
                          return "كلمة المرور غير متطابقة";
                        },
                      ),
                      const SizedBox(height: SharedValues.padding * 3),
                      ButtonWidget(
                        minWidth: double.infinity,
                        onPressed: () async {
                          if(_formKey.currentState!.validate()){
                            final provider = Provider.of<AuthProvider>(context,
                                listen: false);
                            provider.setUser(User(
                                studentNumber: int.parse(studentNumber.text),
                                email: emailController.text,
                                password: passwordController.text));
                            bool status = await provider.sendCode();
                            if (status) {
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const VerifyOTP(isSignUp: false)));
                            } else {
                              // ignore: use_build_context_synchronously
                              SharedComponents.showSnackBar(
                                  context, "An error occurred");
                            }
                          }
                        },
                        child: Text("Save",
                            style: Theme.of(context).textTheme.button),
                      ),
                      const SizedBox(height: SharedValues.padding),
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
                                        builder: (context) =>
                                            const SignInScreen()));
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
      ),
    );
  }
}
