import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';
import 'contants.dart';

class PDFScreen extends StatefulWidget {
  BuildContext context;
  PDFScreen(this.context);

  @override
  _PDFScreenState createState() => _PDFScreenState(context);
}

class _PDFScreenState extends State<PDFScreen> {
  BuildContext contet;
  _PDFScreenState(this.contet);
  String pathPDF = "";
  bool _isPDF = true;
  @override
  void initState() {
    super.initState();
    createFileOfPdfUrl().then((f) {
      setState(() {
        pathPDF = f.path;
        _isPDF = false;
        print(pathPDF);
      });
    });
  }

  Future<File> createFileOfPdfUrl() async {
    final url =
        "https://internshala.com/student/resume_download/56BBECF7-B001-624C-EEF6-3DEE0B3951D3/2301359";
    final filename = url.substring(url.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }

  @override
  Widget build(contet) {
    return _isPDF
        ? Scaffold(
            appBar: AppBar(
              title: Text("Resume",
                  style:
                      TextStyle(color: Colors.white, fontFamily: 'Girassol')),
              backgroundColor: KPrimaryColor,
            ),
            body: Container(
              color: KPrimaryColor.withOpacity(0.75),
              child: Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Loading ...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )
                ],
              )),
            ),
          )
        : PDFViewerScaffold(
            appBar: AppBar(
                backgroundColor: KPrimaryColor,
                title: Text("Resume",
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'Girassol'))),
            path: pathPDF);
  }
}
