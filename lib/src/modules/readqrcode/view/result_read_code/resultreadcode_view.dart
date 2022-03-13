import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

import '../../../../shared/popup_notices/popup_notices.dart';
import 'components/button_url.dart';

class ResultReadCode extends StatefulWidget {
  final String result;
  final BarcodeType typeCode;
  const ResultReadCode({required this.result, required this.typeCode, Key? key})
      : super(key: key);
  @override
  _ResultReadCodeState createState() => _ResultReadCodeState();
}

class _ResultReadCodeState extends State<ResultReadCode> with PopupNotices {
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

  Widget returnButton() => _button;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: _size.height,
        width: _size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: _size.height * 0.07,
                left: _size.width * 0.09,
                bottom: _size.height * 0.008,
              ),
              child: Text(
                AppLocalizations.of(context)!.scanResultQrTitle,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: _size.width * 0.07,
              ),
              height: _size.height * 0.09,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.transparent.withOpacity(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(
                            _size.height * 0.015,
                          ),
                          child: Text(
                            widget.result,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      tooltip:
                          AppLocalizations.of(context)!.scanResultQrToolTip,
                      onPressed: () =>
                          FlutterClipboard.copy(widget.result).then(
                        (_) => popupCopyBoard(context),
                      ),
                      icon: Icon(Icons.copy,
                          color: Theme.of(context).iconTheme.color),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: _size.height * 0.01,
                bottom: _size.height * 0.02,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 12,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      onPressed: () => Share.share(widget.result),
                      child: SizedBox(
                        width: _size.width * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .scanResultQrButtonShare,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const Icon(Icons.share)
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (_button is! Container) const Spacer(),
                  if (_button is! Container)
                    Flexible(
                      flex: 12,
                      child: returnButton(),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
