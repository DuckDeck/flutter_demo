
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:r_scan/r_scan.dart';
class ScanBarPage extends StatelessWidget {
  const ScanBarPage({Key key}) : super(key: key);


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
        body: Container(
          padding:EdgeInsets.all(20.0),
          child: Column(children: <Widget>[
            RaisedButton(child: Text("扫码"),
            onPressed: scanImage,
            )
          ],),
        ),
      ),
    );
  }

  void scanImage() async{
    final result = await RScan.scanImagePath("path");
    if(result.isNotEmpty){

    }
  }
} 
