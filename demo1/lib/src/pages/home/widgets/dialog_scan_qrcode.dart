import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class DialogScanQRCode extends StatefulWidget {
  const DialogScanQRCode({Key? key}) : super(key: key);

  @override
  _DialogScanQRCodeState createState() => _DialogScanQRCodeState();
}

class _DialogScanQRCodeState extends State<DialogScanQRCode> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  String code = '12312341234';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 12),
            Stack(
              children: [
                _buildQRView(),

                Container(child: Text(code), color: Colors.white,),


                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.red,
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              width: double.infinity,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('close'),
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox _buildQRView() => SizedBox(
        height: 300,
        child: QRView(
          key: _qrKey,
          onQRViewCreated: (QRViewController controller) {
            controller.scannedDataStream.listen((scanData) {
              controller.stopCamera();
              setState(() {
                code = scanData.code!;
              });
            });
          },
        ),
      );
}
