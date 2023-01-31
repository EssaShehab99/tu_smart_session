import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tu_smart_session/data/utils/utils.dart';
import '/data/models/user.dart';
import '/data/providers/auth_provider.dart';
import '/views/shared/assets_variables.dart';
import '/views/shared/shared_components.dart';
import '/views/shared/shared_values.dart';
import 'package:provider/provider.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  User? _user;
  @override
  void initState() {
    _user=Provider.of<AuthProvider>(context,listen: false).user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SharedComponents.appBar("Digital Wallet"),
          Expanded(child: ListView(
            children: [
              _buildCard("University Card", [
                "Name: ${_user?.universityCard?.name}",
                "ID: ${_user?.universityCard?.id}",
                "Department: ${_user?.universityCard?.department}",
                "Email: ${_user?.universityCard?.email}",
                "College: ${_user?.universityCard?.college}",
                "Academic Degree: ${_user?.universityCard?.academicDegree}",
              ]),
              _buildCard("Gym Membership Card", [
                "Name: ${_user?.gymCard?.name}",
                "ID: ${_user?.gymCard?.id}",
                "Joining: ${Utils.replaceArabicNumber(DateFormat("yyyy-MM-dd").format(_user?.gymCard?.expire??DateTime.now()))}",
                "Expire: ${Utils.replaceArabicNumber(DateFormat("yyyy-MM-dd").format(_user?.gymCard?.expire??DateTime.now()))}",
              ]),
              _buildCard("Health Status Card", [
                "Name: ${_user?.healthCard?.name}",
                "ID: ${_user?.healthCard?.id}",
                "Date of Birth: ${Utils.replaceArabicNumber(DateFormat("yyyy-MM-dd").format(_user?.healthCard?.dateOfBirth??DateTime.now()))}",
                "Blood Type: ${_user?.healthCard?.bloodType}",
                "Chronic Disease: ${_user?.healthCard?.chronicDisease}",
                "Medication: ${_user?.healthCard?.medication}",
                "Emergency Contact 1: ${_user?.healthCard?.emergencyContact1}",
                "Emergency Contact 2: ${_user?.healthCard?.emergencyContact2}",
              ]),
            ],
          ))
        ],
      ),
    ));
  }

  Widget _buildCard(String title, List<String> list) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(SharedValues.padding),
            child: Text(title, style: Theme.of(context).textTheme.headline3),
          ),
          Padding(
            padding: const EdgeInsets.all(SharedValues.padding),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(SharedValues.borderRadius),
                  border: Border.all(color: Theme.of(context).primaryColor)),
              child: Row(
                crossAxisAlignment: list.length>4?CrossAxisAlignment.start:CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.all(SharedValues.padding),
                    margin: const EdgeInsets.all(SharedValues.padding),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(SharedValues.borderRadius),
                        border:
                            Border.all(color: Theme.of(context).primaryColor)),
                    child: SvgPicture.asset(AssetsVariable.support),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var item in list)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: SharedValues.padding * 0.5),
                          child: Text(item,
                              style: Theme.of(context).textTheme.headline3),
                        ),
                    ],
                  )),
                ],
              ),
            ),
          )
        ],
      );
}
