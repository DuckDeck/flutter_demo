class CatInfo {
  CatInfo({this.name,this.urlSegment});
  final String name;
  final String urlSegment;
}

class ImgInfo {
  ImgInfo({this.imgName,this.imgPage,this.imgUrl});
   var imgPage = "";
   var imgUrl = "";
   var imgName = "";
}

class ImgDetail {
  var imgUrl = "";
  Reslotion resolution ;
  var size = 0.0;
  var sizeStr = "";
  var updateTimeStr = "";
  List<ImgInfo> moreImages;

  @override
  String toString() {

    return "图片地址$imgUrl _ 图片解析度$resolution _ 图片大小 $sizeStr";
  }

}

class Reslotion {
  Reslotion({this.width,this.height});
  var width = 0;
  var height = 0;
  static Reslotion parse(String str){
    if(str.contains("x") || str.contains("X")){
      final parts =  str.toLowerCase().split("x");
      if(parts.last.length == 0){
        return Reslotion(width: 0,height: 0);
      }
      return Reslotion(width: int.parse(parts.first),height: int.parse(parts.last));
    }
    else{
      return Reslotion(width: 0,height: 0);
    }
  }

  @override
  String toString() {

    return "$width X $height";
  }
}