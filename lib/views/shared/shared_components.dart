import 'dart:ui';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/data/providers/auth_provider.dart';
import '/views/auth/auth_screen.dart';
import 'package:provider/provider.dart';
import '/views/shared/assets_variables.dart';
import '/views/shared/shared_values.dart';

class SharedComponents {
  SharedComponents._privateConstructor();
  static final SharedComponents _instance =
      SharedComponents._privateConstructor();
  static SharedComponents get instance => _instance;

  static Widget appBar(String title, {bool? withBackBtn,bool? withUserOptions}) {
    List<String> listItem=["Sign out"];
    return Builder(
      builder: (context) => Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(SharedValues.borderRadius * 2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  child: withUserOptions==true? PopupMenuButton<int>(
                      onSelected: (value) async {
                        await Provider.of<AuthProvider>(context,listen: false).signOut();
                        // ignore: use_build_context_synchronously
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AuthScreen(),), (route) => false);
                      },
                      itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<int>>[
                        for (var item in listItem)
                          PopupMenuItem(
                            value: listItem.indexOf(item),
                            child: Text(
                              item,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          )
                      ],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal:SharedValues.padding),
                        child: Icon(
                          Icons.more_vert,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      )):withBackBtn == false
                      ? null
                      : IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back)),
                ),
                Expanded(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(SharedValues.padding * 2,
                        0, SharedValues.padding * 2, SharedValues.padding),
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              title,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: SvgPicture.asset(
                              AssetsVariable.appCircleLogo,
                              alignment: AlignmentDirectional.centerEnd,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ));
  }

  static Future<dynamic> showBottomSheet(BuildContext context,
      {double? height, Widget? child}) {
    final mediaQuery = MediaQuery.of(context);
    return showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(SharedValues.borderRadius * 2))),
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          height: (mediaQuery.orientation == Orientation.portrait)
              ? height ?? (mediaQuery.size.height * 0.75)
              : mediaQuery.size.height,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(SharedValues.borderRadius)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: SharedValues.padding * 2),
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Theme.of(context).dividerColor,
                      borderRadius:
                          BorderRadius.circular(SharedValues.borderRadius)),
                ),
              ),
              Expanded(child: child ?? const SizedBox.shrink())
            ],
          ),
        ),
      ),
    );
  }


  static showSnackBar(context, String text, {Color? backgroundColor}) {
    return WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ));
    });
  }
  static Future<dynamic> showOverlayLoading(
      BuildContext context, Function() futureFun) =>
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: FutureBuilder(
              future: futureFun(),
              builder: (_, snapshot) {
                if(snapshot.connectionState==ConnectionState.done){
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pop(context);
                  });
                }
                return SizedBox(
                    height: 200,
                    width: 200,
                    child: Align(
                      child: AvatarGlow(
                        glowColor: Theme.of(context).primaryColor,
                        duration: const Duration(
                          milliseconds: 2000,
                        ),
                        repeat: true,
                        showTwoGlows: true,
                        endRadius: 50,
                        child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(120)),
                            child:  CircularProgressIndicator(
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              valueColor:
                              AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                            )),
                      ),
                    ));
              }
            ),
          );
        },
      );
}
