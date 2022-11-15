import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Uint8List> makePdf(Map data) async {
  final pdf = Document();
  // final imageLogo = MemoryImage((await rootBundle.load('assets/technical_logo.png')).buffer.asUint8List());

  pdf.addPage(
    Page(
      build: (context) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Example PDF Valor Document']}"),
                    Text('SIA FECT'),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ],
            ),
            Container(height: 50),
            Table(
              border: TableBorder.all(color: PdfColors.black),
              children: [
                TableRow(
                  children: [
                    Padding(
                      child: Text(
                        '${data['name']}',
                        style: Theme.of(context).header4,
                        textAlign: TextAlign.center,
                      ),
                      padding: EdgeInsets.all(20),
                    ),
                    Padding(
                      child: Text(
                        '${data['registration_number']}',
                        style: Theme.of(context).header4,
                        textAlign: TextAlign.center,
                      ),
                      padding: EdgeInsets.all(20),
                    ),
                  ],
                ),
              ],
            ),
            ...data['score'].map(
              (e) => Table(
                children: [
                  TableRow(
                    children: [
                      PaddedText('${e['year']}'),
                      PaddedText('Media: ${e['Media']}'),
                    ],
                  ),
                  TableRow(
                    children: [
                      PaddedText('', align: TextAlign.right),
                      PaddedText('IP: ${e['ip']}'),
                    ],
                  ),
                  TableRow(
                    children: [
                      Divider(
                        height: 1,
                        borderStyle: BorderStyle.dashed,
                      ),
                      Divider(
                        height: 1,
                        borderStyle: BorderStyle.dashed,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      },
    ),
  );
  return pdf.save();
}

Widget PaddedText(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        text,
        textAlign: align,
      ),
    );
