import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentor_app/views/shared/assets_variables.dart';
import 'package:mentor_app/views/shared/shared_values.dart';

class SharedComponents {
  SharedComponents._privateConstructor();
  static final SharedComponents _instance =
      SharedComponents._privateConstructor();
  static SharedComponents get instance => _instance;

  static Widget appBar(String title,{bool? withBackBtn}) => Builder(
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
                  child: withBackBtn==false?null:IconButton(
                      onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
                ),
                Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(SharedValues.padding*2,0,SharedValues.padding*2,SharedValues.padding),
                        child: Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: Text(title,style: Theme.of(context).textTheme.headline2,),
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
              Expanded(
                child:child??const SizedBox.shrink()
              )
            ],
          ),
        ),
      ),
    );
  }
}
