import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scannerqrcode_premium/src/shared/launch_link/launch_link.dart';
import 'package:easy_localization/easy_localization.dart';

class ButtonContact extends StatelessWidget {
  const ButtonContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h, bottom: 10.h),
      child: SizedBox(
        height: 45.h,
        child: OutlinedButton(
          onPressed: () => launchLink('mailto:ScannerQRCode@protonmail.com'),
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
                  'settingsContact'.tr(),
                  style: TextStyle(fontSize: 18.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.w, top: 7.h, bottom: 7.h),
                child: Icon(Icons.mail, size: 28.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}