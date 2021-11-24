import 'package:flutter/material.dart';
import 'package:scannerqrcode_premium/src/modules/readqrcode/view/result_read_code/components/buttonopen/button_url.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share/share.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class ResultReadCode extends StatefulWidget {
  final String result;
  final BarcodeType typeCode;
  const ResultReadCode({required this.result, required this.typeCode, Key? key})
      : super(key: key);
  @override
  _ResultReadCodeState createState() => _ResultReadCodeState();
}

class _ResultReadCodeState extends State<ResultReadCode> {
  late final Widget _button;

  @override
  void initState() {
    if (widget.typeCode == BarcodeType.url) {
      _button = ButtonUrl(link: widget.result);
    } else {
      _button = Container();
    }
    super.initState();
  }

  void _popupCopyBoard() {
    Future.delayed(
        const Duration(milliseconds: 500), () => Navigator.pop(context));
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('scanResultPopupCopy'.tr() + '.'),
      ),
    );
  }

  Widget returnButton() => _button;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff202020),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50.0.h, left: 30.w, bottom: 10.w),
            child: Text(
              'scanResultQrTitle'.tr(),
              style: TextStyle(fontSize: 20.sp),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 27.w),
            width: 500.w,
            height: 70.h,
            child: Card(
              color: Colors.transparent.withOpacity(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(8.0.sp),
                        child: Text(
                          widget.result,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: 'scanResultQrToolTip'.tr(),
                    onPressed: () => FlutterClipboard.copy(widget.result).then(
                      (_) => _popupCopyBoard(),
                    ),
                    icon: const Icon(Icons.copy),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10.h, bottom: 100.h),
                child: ElevatedButton(
                  onPressed: () => Share.share(widget.result),
                  child: SizedBox(
                    width: 130.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'scanResultQrButtonShare'.tr(),
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        const Icon(Icons.share)
                      ],
                    ),
                  ),
                ),
              ),
              returnButton()
            ],
          ),
        ],
      ),
    );
  }
}