import 'package:flutter/material.dart';
import 'package:scannerqrcode_premium/src/modules/createqrcode/view/create_qr_code/components/body_form_contact/body_form_contact.dart';
import 'package:scannerqrcode_premium/src/modules/createqrcode/view/create_qr_code/components/body_form_facebook/body_form_facebook.dart';
import 'package:scannerqrcode_premium/src/modules/createqrcode/view/create_qr_code/components/body_form_github/body_form_github.dart';
import 'package:scannerqrcode_premium/src/modules/createqrcode/view/create_qr_code/components/body_form_instagram/body_form_instagram.dart';
import 'package:scannerqrcode_premium/src/modules/createqrcode/view/create_qr_code/components/body_form_link/body_form_link.dart';
import 'package:scannerqrcode_premium/src/modules/createqrcode/view/create_qr_code/components/body_form_reddit/body_form_reddit.dart';
import 'package:scannerqrcode_premium/src/modules/createqrcode/view/create_qr_code/components/body_form_text/body_form_text.dart';
import 'package:scannerqrcode_premium/src/modules/createqrcode/view/create_qr_code/components/body_form_tiktok/body_form_tiktok.dart';
import 'package:scannerqrcode_premium/src/modules/createqrcode/view/create_qr_code/components/body_form_twitch/body_form_twitch.dart';
import 'package:scannerqrcode_premium/src/modules/createqrcode/view/create_qr_code/components/body_form_twitter/body_form_twitter.dart';
import 'package:scannerqrcode_premium/src/modules/createqrcode/view/create_qr_code/components/body_form_whatsapp/body_form_whatsapp.dart';
import 'package:scannerqrcode_premium/src/modules/createqrcode/view/create_qr_code/components/body_form_wifi/body_form_wifi.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:scannerqrcode_premium/src/modules/createqrcode/view/create_qr_code/components/body_form_youtube/body_form_youtube.dart';

class CreateQRCodeView extends StatefulWidget {
  final String typeQRCode;
  const CreateQRCodeView({required this.typeQRCode, Key? key})
      : super(key: key);

  @override
  _CreateQRCodeViewState createState() => _CreateQRCodeViewState();
}

class _CreateQRCodeViewState extends State<CreateQRCodeView> {
  late final Widget _bodyFormQRCodeWidget;
  late final String _titleAppBar;

  @override
  void initState() {
    if (widget.typeQRCode == 'text') {
      _bodyFormQRCodeWidget = BodyFormText();
      _titleAppBar = 'createQRCodeTitleText'.tr();
    } else if (widget.typeQRCode == 'wifi') {
      _bodyFormQRCodeWidget = BodyFormWifi();
      _titleAppBar = 'createQRCodeTitleWifi'.tr();
    } else if (widget.typeQRCode == 'link') {
      _titleAppBar = 'createQRCodeTitleLink'.tr();
      _bodyFormQRCodeWidget = BodyFormLink();
    } else if (widget.typeQRCode == 'contact') {
      _titleAppBar = 'createQRCodeTitleContact'.tr();
      _bodyFormQRCodeWidget = BodyFormContact();
    } else if (widget.typeQRCode == 'github') {
      _titleAppBar = 'createQRCodeTitleGithub'.tr();
      _bodyFormQRCodeWidget = BodyFormGithub();
    } else if (widget.typeQRCode == 'whatsapp') {
      _titleAppBar = 'createQRCodeTitleWhatsapp'.tr();
      _bodyFormQRCodeWidget = BodyFormWhatsapp();
    } else if (widget.typeQRCode == 'instagram') {
      _bodyFormQRCodeWidget = BodyFormIstagram();
      _titleAppBar = 'createQRCodeTitleInstagram'.tr();
    } else if (widget.typeQRCode == 'tiktok') {
      _titleAppBar = 'createQRCodeTitleTiktok'.tr();
      _bodyFormQRCodeWidget = BodyFormTiktok();
    } else if (widget.typeQRCode == 'facebook') {
      _titleAppBar = 'createQRCodeTitleFacebook'.tr();
      _bodyFormQRCodeWidget = BodyFormFacebook();
    } else if (widget.typeQRCode == 'youtube') {
      _titleAppBar = 'createQRCodeTitleYoutube'.tr();
      _bodyFormQRCodeWidget = BodyFormYoutube();
    } else if (widget.typeQRCode == 'twitter') {
      _titleAppBar = 'createQRCodeTitleTwitter'.tr();
      _bodyFormQRCodeWidget = BodyFormTwitter();
    } else if (widget.typeQRCode == 'twitch') {
      _titleAppBar = 'createQRCodeTitleTwitch'.tr();
      _bodyFormQRCodeWidget = BodyFormTwitch();
    } else if (widget.typeQRCode == 'reddit') {
      _titleAppBar = 'createQRCodeTitleReddit'.tr();
      _bodyFormQRCodeWidget = BodyFormReddit();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff202020),
        title: Text(_titleAppBar),
      ),
      body: _bodyFormQRCodeWidget,
    );
  }
}
