import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  final String? qrCodeContent;

  NewPage(this.qrCodeContent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Content'),
      ),
      body: Center(
        child: Text(qrCodeContent ?? 'No QR code content'),
      ),
    );
  }
}
