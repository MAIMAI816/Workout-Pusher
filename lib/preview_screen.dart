/*
 * Copyright (c) 2019 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:workout_pusher/timeline.dart';

class PreviewImageScreen extends StatefulWidget {
  final String imagePath;

  PreviewImageScreen({this.imagePath});

  @override
  _PreviewImageScreenState createState() => _PreviewImageScreenState();
}

class _PreviewImageScreenState extends State<PreviewImageScreen> {
  void _pickSaveImage(context) {
    String fileName =
        new DateFormat("yyyy-MM-dd").format(DateTime.now()) + '.jpg';
    StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = ref.putFile(File(widget.imagePath));
    _addDatabase(fileName, context);
  }

  Future<Uri> _addDatabase(String fileName, BuildContext context) async {
    final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'addDayWorkout',
    );
    dynamic resp = await callable.call(<String, dynamic>{
      'date': DateTime.now().toString(),
      'imgUrl': fileName
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TimelinePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Image.file(File(widget.imagePath), fit: BoxFit.cover)),
            SizedBox(height: 10.0),
            Flexible(
              flex: 1,
              child: Container(
                  padding: EdgeInsets.all(60.0),
                  child: FlatButton(
                      child: Text(
                        'Save workout plan',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      color: Colors.blue,
                      padding: EdgeInsets.all(15.0),
                      onPressed: () {
                        _pickSaveImage(context);
                      })),
            )
          ],
        ),
      ),
    );
  }

  Future<ByteData> getBytesFromFile() async {
    Uint8List bytes = File(widget.imagePath).readAsBytesSync() as Uint8List;
    return ByteData.view(bytes.buffer);
  }
}
