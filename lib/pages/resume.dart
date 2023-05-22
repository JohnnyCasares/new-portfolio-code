import 'dart:html';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});
  final String pdfPath = "lib/assets/documents/JohnnyACasaresResumeWebApp.pdf";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            downloadFile(
                "assets/lib/assets/documents/JohnnyACasaresResumeWebApp.pdf");
          },
          child: const Icon(Icons.download)),
      body: SfPdfViewer.asset(
        pdfPath,
      ),
    );
  }

  downloadFile(url) {
    AnchorElement anchorElement = AnchorElement(href: url);
    anchorElement.download = "JohnnyCasaresResume";
    anchorElement.click();
  }
}
