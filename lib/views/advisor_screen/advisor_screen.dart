import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/data/providers/advisor_provider.dart';
import '/views/shared/assets_variables.dart';
import '/views/shared/button_widget.dart';
import '/views/shared/shared_components.dart';
import '/views/shared/shared_values.dart';
import '/views/shared/text_field_widget.dart';
import 'package:provider/provider.dart';

class AdvisorScreen extends StatefulWidget {
  const AdvisorScreen({Key? key}) : super(key: key);

  @override
  State<AdvisorScreen> createState() => _AdvisorScreenState();
}

class _AdvisorScreenState extends State<AdvisorScreen> {
  late TextEditingController userName;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    userName = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SharedComponents.appBar("Academic Advisor Session"),
          Expanded(
              child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(SharedValues.padding),
              children: [
                Padding(
                  padding: const EdgeInsets.all(SharedValues.padding * 4),
                  child: SvgPicture.asset(
                    AssetsVariable.support,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
                Text("Please Enter The Academic Advisor Username:",
                    style: Theme.of(context).textTheme.headline3),
                const SizedBox(height: SharedValues.padding),
                TextFieldWidget(
                  controller: userName,
                  hintText: "Username",
                ),
                const SizedBox(height: SharedValues.padding * 4),
                ButtonWidget(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final provider =
                          Provider.of<AdvisorProvider>(context, listen: false);
                      await provider.getAdvisor(userName.text);
                    }
                  },
                  minWidth: double.infinity,
                  child: Text(
                    "Start Conversation",
                    style: Theme.of(context).textTheme.button,
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
