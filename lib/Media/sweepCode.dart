
import 'dart:io';
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
var _imgPath;
var _scanResult = "";
@override
void initState() { 
  super.initState();
  initController();
}
bool isFirst = true;

Future<void> initController() async{
 
}

  Future<bool> canReadStorage() async{
  if(Platform.isIOS) return true;
  var status = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
  if(status != PermissionStatus.granted){
    var future = await PermissionHandler().requestPermissions([PermissionGroup.storage]);
    for(final item in future.entries){
      if(item.value != PermissionStatus.granted){
        return false;
      } 
    }
  }
  else{
    return true;
  }  
  return true;
}

Future<bool> canOpenCamera() async{
   var status = await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);
   if(status != PermissionStatus.granted){
     var future = await PermissionHandler().requestPermissions([PermissionGroup.camera]);
     for(final item in future.entries){
       if(item.value != PermissionStatus.granted){
         return false;
       }
     }
   }
   else{
     return true;
   }
   return true;
}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("扫码"),),
        body: Column(
          children: <Widget>[
            Center(child: RaisedButton(onPressed: ()=>{
              _openGallery()
            }, child: Text("扫图片中的码"),),),
            Center(child: RaisedButton(onPressed: null, child: Text("扫描图片链接的码"),),),
            Center(child: RaisedButton(onPressed: ()=>{
              _scanMemeryImage()
            }, child: Text("扫描内存图片的码"),),),
            Center(child: RaisedButton(onPressed: null, child: Text("打开摄像头扫码")),),
            Text(_scanResult)
          ],
        )
      ),
    );
  }


  _openGallery() async{
    var img = await ImagePicker.pickImage(source: ImageSource.gallery);
   setState(() {
     _imgPath = img;
   });
   final result = await RScan.scanImagePath(img.path);
   print(result.message);
   setState(() {
     _scanResult = result.message;
   });
  }

  _scanMemeryImage() async{
    var data = await rootBundle.load("Images/barcode.png");
    final result = await RScan.scanImageMemory(data.buffer.asUint8List());
    setState(() {
     _scanResult = result.message;
   });
  }

  void scanImage() async{
    var img = await ImagePicker.pickImage(source: ImageSource.gallery);
    
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