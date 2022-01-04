import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scannerqrcode_premium/src/shared/launch_link/launch_link.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scannerqrcode_premium/src/shared/themes/text_themes.dart';

class ButtonRateApp extends StatelessWidget with OpenLink {
  const ButtonRateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h, bottom: 10.h),
      child: SizedBox(
        height: 45.h,
        child: OutlinedButton(
          onPressed: () => openLink(
              'https://play.google.com/store/apps/details?id=com.scannerqrcode_premium'),
          style: OutlinedButton.styleFrom(
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              side: BorderSide(color: Colors.black, width: 2.w)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Text(
                  AppLocalizations.of(context)!.settingsRateTheApp,
                  style: AppTextThemes.buttonsSettings,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.w, top: 7.h, bottom: 7.h),
                child: Icon(Icons.rate_review, size: 28.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
