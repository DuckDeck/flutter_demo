import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:r_scan/r_scan.dart';

class ScancodePage extends StatefulWidget {
  @override
  _ScancodePageState createState() => _ScancodePageState();
}

class _ScancodePageState extends State<ScancodePage> {
  Uint8List _imgUint8List = Uint8List(0);
  var _scanResult = "";
  @override
  void initState() {
    super.initState();
    initController();
  }

  bool isFirst = true;

  Future<void> initController() async {}

  Future<bool> canReadStorage() async {
    if (Platform.isIOS) return true;
    var status = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);
    if (status != PermissionStatus.granted) {
      var future = await PermissionHandler()
          .requestPermissions([PermissionGroup.storage]);
      for (final item in future.entries) {
        if (item.value != PermissionStatus.granted) {
          return false;
        }
      }
    } else {
      return true;
    }
    return true;
  }

  Future<bool> canOpenCamera() async {
    var status =
        await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);
    if (status != PermissionStatus.granted) {
      var future = await PermissionHandler()
          .requestPermissions([PermissionGroup.camera]);
      for (final item in future.entries) {
        if (item.value != PermissionStatus.granted) {
          return false;
        }
      }
    } else {
      return true;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text("扫码"),
          ),
          body: Column(
            children: <Widget>[
              Center(
                child: RaisedButton(
                  onPressed: () => {_openGallery()},
                  child: Text("扫图片中的码"),
                ),
              ),
              Center(
                child: RaisedButton(
                  onPressed: null,
                  child: Text("扫描图片链接的码"),
                ),
              ),
              Center(
                child: RaisedButton(
                  onPressed: () => {_scanMemeryImage()},
                  child: Text("扫描内存图片的码"),
                ),
              ),
              Center(
                child: RaisedButton(onPressed: () => {_scanCamera()}, child: Text("打开摄像头扫码")),
              ),
              Image.memory(_imgUint8List),
              Text(_scanResult)
            ],
          )),
    );
  }

  _openGallery() async {
    var img = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgUint8List = img.readAsBytesSync();
    });
    final result = await RScan.scanImagePath(img.path);
    if (result.message != null) {
      setState(() {
        _scanResult = result.message;
      });
    } else {
      _scanResult = "图片中没有用于扫的码！";
    }
  }

  _scanMemeryImage() async {
    var data = await rootBundle.load("Images/barcode.png");
    final result = await RScan.scanImageMemory(data.buffer.asUint8List());
    setState(() {
      _imgUint8List = data.buffer.asUint8List();
      _scanResult = result.message;
    });
  }

   _scanCamera() async {
    var img = await ImagePicker.pickImage(source: ImageSource.camera);

    final result = await RScan.scanImagePath(img.path);
    // if(result.isNotEmpty){
    //   print("扫描结果是: $result");
    // }
    // else{
    //    print("图片没有二维码: $result");
    // }
  }
}

// FutureBuilder<bool>(
//             future: canOpenCamera(),
//             builder: (BuildContext context,AsyncSnapshot<bool> snapshot){
//               if(snapshot.hasData && snapshot.data == true){

//               }
//             },
//         )
