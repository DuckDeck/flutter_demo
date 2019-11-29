
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:r_scan/r_scan.dart';
class ScanBaecodePage extends StatefulWidget {
  @override
  _ScanBaecodePageState createState() => _ScanBaecodePageState();
}

class _ScanBaecodePageState extends State<ScanBaecodePage> {

RScanController _controller;

@override
void initState() { 
  super.initState();
  initController();
}
bool isFirst = true;

Future<void> initController() async{
  _controller = RScanController();
  _controller.addListener((){
    final result = _controller.result;
    if(result != null){
      if(isFirst){
        Navigator.of(context).pop(result);
        isFirst = false;
      }
    }
  });
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
        body: FutureBuilder<bool>(
            future: canOpenCamera(),
            builder: (BuildContext context,AsyncSnapshot<bool> snapshot){
              if(snapshot.hasData && snapshot.data == true){
                
              }
            },
        )
      ),
    );
  }



  void scanImage() async{
    var img = await ImagePicker.pickImage(source: ImageSource.gallery);
    
    final result = await RScan.scanImagePath(img.path);
    if(result.isNotEmpty){
      print("扫描结果是: $result");
    }
    else{
       print("图片没有二维码: $result");
    }
  }
}