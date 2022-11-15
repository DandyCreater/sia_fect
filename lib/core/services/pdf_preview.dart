import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:sia_fect/core/services/external_storage_helper.dart';
import 'pdf_export.dart';

class PdfPreviewPage extends StatelessWidget {
  final Map invoice;
  final FileDownloadHelper fileDownloadHelper = FileDownloadHelper();

  PdfPreviewPage({Key? key, required this.invoice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) async {
          final bytes = await makePdf(invoice);
          fileDownloadHelper.downloadDocument(bytes);
          return bytes;
        },
      ),
    );
  }
}
