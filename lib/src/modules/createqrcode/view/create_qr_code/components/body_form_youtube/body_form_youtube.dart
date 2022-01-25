import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scannerqrcode_premium/src/modules/createqrcode/view/create_qr_code/components/base_for_form/base_for_form.dart';

class BodyFormYoutube extends BaseForm {
  const BodyFormYoutube({Key? key}) : super(key: key);

  @override
  _BodyFormYoutubeState createState() => _BodyFormYoutubeState();
}

class _BodyFormYoutubeState extends State<BodyFormYoutube> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  String _filterToCreateQrcodeYoutube() =>
      _textEditingController.text.contains('https://www.youtube.com/') ||
              _textEditingController.text.contains('https://youtu.be/') ||
              _textEditingController.text.contains('https://youtube.com/')
          ? _textEditingController.text
          : 'https://youtu.be/' + _textEditingController.text;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.getKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 50.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 15.sp),
                  child: Text(
                    AppLocalizations.of(context)!.createQRCodeYoutubeMsg1,
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.sp),
                  child: Text(
                    AppLocalizations.of(context)!.createQRCodeYoutubeMsg2,
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.createQRCodeYoutubeMsg3,
                  style: TextStyle(fontSize: 14.sp),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 50.h, left: 30.w, right: 30.w),
            child: TextFormField(
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return AppLocalizations.of(context)!
                      .createQRCodeYoutubeValidatorError;
                }
              },
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!
                        .createQRCodeYoutubeLabelDecorate +
                    ' ...',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 90.w),
            child: widget.makeButtoncreateQRCode(
                context: context, filter: _filterToCreateQrcodeYoutube),
          ),
        ],
      ),
    );
  }
}
