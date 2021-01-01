import 'dart:convert';
import 'dart:io';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_demo/Project/Blog/Model/UserInfo.dart';
import 'package:path_provider/path_provider.dart';

const _key = "751f621ea5c8f930";
const _iv = "2624750004598718";

const BaseUrl = "http://api.bqbbq.com/api";
UserInfo currentUser ;
  Future<File> getDataFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    var path = Directory(dir + "/" + "blog");
    if (!path.existsSync()) {
      path.createSync();
    }
    final filePath = path.path + "/" + "blog.text";
    return new File(filePath);
  }

  Future<UserInfo> getUserInfo() async {
    final file = await getDataFile();
    final contents = await file.readAsString();
    
    dynamic item = jsonDecode(contents);
 
    final userInfo = UserInfo.fromJson(item);
    return userInfo;
  }

  void saveUserInfo(UserInfo userInfo) async {
    final file = await getDataFile();
    final data = jsonEncode(userInfo);
    file.writeAsString(data);
  }

  String encryptPassword(String password){
    final timeStamp = new DateTime.now().millisecondsSinceEpoch;
    final offset = new DateTime.now().timeZoneOffset;
    final para = timeStamp + offset.inMinutes * 60000;
    final str = password + "=" + para.toString();
    return encrypt(str);
  }

  String encrypt(String str){
    final key = Key.fromUtf8(_key);
    final iv = IV.fromUtf8(_iv);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(str, iv: iv);
    return encrypted.base64;
  }

  String decrypt(String str){
    final key = Key.fromUtf8(_key);
    final iv = IV.fromUtf8(_iv);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final dncrypted = encrypter.decrypt64(str,iv: iv);
    return dncrypted.toString();
  }

  const regex_Chinese = r"^[\u4e00-\u9fa5]+$";
  const regex_Email = r"\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*";
  

    // print(_textEditingController.text);
    // if (!RegExp(regex).hasMatch(_textEditingController.text)) {
    //   Fluttertoast.showToast(msg: "请输入中文");
    //   return;
    // }

//这里也要弄一个grandstore这样的东西才方便
class GrandStore<T>{
  
}