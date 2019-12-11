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
  Reslution resulution ;
  var size = 0.0;
}

class Reslution {
  Reslution({this.width,this.height});
  var width = 0;
  var height = 0;
  static Reslution parse(String str){
    if(str.contains("x") || str.contains("X")){
      final parts =  str.toLowerCase().split("x");
      if(parts.last.length == 0){
        return Reslution(width: 0,height: 0);
      }
      return Reslution(width: int.parse(parts.first),height: int.parse(parts.last));
    }
    else{
      return Reslution(width: 0,height: 0);
    }
  }
}