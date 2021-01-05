import 'package:dio/dio.dart';
import 'package:flutter_demo/Project/4KImage/model.dart';
import 'package:flutter_demo/Project/Blog/Model/SortInfo.dart';
import 'package:flutter_demo/Project/Blog/Model/UserLinkInfo.dart';
import 'package:flutter_demo/Project/Blog/config.dart';
import 'package:flutter_demo/ResultInfo.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
part 'UserInfo.g.dart';
@JsonSerializable()
@immutable
class UserInfo {
  @JsonKey(name: "user_id")
  int id;

  @JsonKey(name: "user_real_name")
  String realName;

  @JsonKey(name: "article_count")
  int articleCount;
  
  @JsonKey(name: "comment_count")
  int commentCount;

  @JsonKey(name: "user_image_url")
  String headImage;

  @JsonKey(name: "user_address")
  String address;


  @JsonKey(name: "user_birthday")
  int birthday;


  @JsonKey(name: "user_description")
  String description;


  @JsonKey(name: "user_email")
  String email;


  @JsonKey(name: "user_gender")
  int gender;


  @JsonKey(name: "user_name")
  String userName;


  @JsonKey(name: "user_phone")
  String phone;


  @JsonKey(name: "user_qq")
  String qq;


  @JsonKey(name: "user_says")
  String says;

  @JsonKey(name: "articles_be_liked_count")
  int userLikedArticleCount;

  @JsonKey(name: "is_attention")
  bool isAttention;

  String token;

  List<UserLinkInfo> links;

  List<SortInfo> sorts;

  UserInfo();
    factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);


  UserInfo copyUser() {
    final newUser = UserInfo();
    newUser.id = this.id;
    newUser.address = this.address;
    newUser.articleCount = this.articleCount;
    newUser.birthday = this.birthday;
    newUser.commentCount = this.commentCount;
    newUser.description = this.description;
    newUser.email = this.email;
    newUser.gender = this.gender;
    newUser.headImage = this.headImage;
    newUser.isAttention = this.isAttention;
    newUser.links = this.links;
    newUser.phone = this.phone;
    newUser.qq = this.qq;
    newUser.realName = this.realName;
    newUser.says = this.says;
    newUser.sorts = this.sorts;
    newUser.token = this.token;
    newUser.userLikedArticleCount = this.userLikedArticleCount;
    newUser.userName = this.userName;
    return newUser;
  }

  static Future<ResultInfo> login(String username, String password) async {
    var url = BaseUrl + "/login";
    final dio = new Dio();
    final encryPass = encryptPassword(password);
    final data = {"userName":username,"password":encryPass};
    final res = await dio.post(url,data: data);
    final result = ResultInfo.toResult(res);
    if (result.code != 0) {
      return result;
    }
    final user = UserInfo.fromJson(result.data);
    result.data = user;
    saveUserInfo(user);
    currentUser = user;
    return result;
  }

   static Future<ResultInfo> searchUser(String key,int index) async{
    var url = "$BaseUrl/search/$key/user/$index/10";
    final dio = new Dio();
    final res = await dio.get(url);
    
    final result = ResultInfo.toResult(res);
    if (result.code != 0) {
      return result;
    }
    List<dynamic> userDatas = result.data;
    List<UserInfo> users = List<UserInfo>();

    for (var item in userDatas) {
      final a = UserInfo.fromJson(item);
      users.add(a);
    }
    result.data = users;
    return result;
  }

  static Future<ResultInfo> getUseiInfo(int targetUserId, int userId) async{
    var url = "$BaseUrl/user/$targetUserId/$userId/" + createToken();
    print(url);
    final dio = new Dio();
    final res = await dio.get(url);
    final result = ResultInfo.toResult(res);
    if (result.code != 0) {
      return result;
    }
    final user = UserInfo.fromJson(result.data);
    result.data = user;
    return result;
  }
}
