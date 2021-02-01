
typedef GetObject = Function(dynamic object);
class NotifcationCenter{
  factory NotifcationCenter()=>_getInstance();
  static NotifcationCenter get instance =>_getInstance();
  static NotifcationCenter _instance;
  NotifcationCenter._internal(){

  }

  static NotifcationCenter _getInstance(){
    if(_instance == null){
      _instance = new NotifcationCenter._internal();
    }
    return _instance;
  }

  Map<String,dynamic> postNameMap = Map<String,dynamic>();
  Map<String, GetObject> getObject = Map<String, GetObject>();
  //添加监听者方法
  addObserver(String postName,object(dynamic object)){
    postNameMap[postName] = null;
    getObject[postName] = object;
  }
//发送通知传值
  postNotification(String postName,dynamic object){
    if(postNameMap.containsKey(postName)){
      postNameMap[postName] = object;
      getObject[postName](postNameMap[postName]);
    }
  }
//移除通知
  removeNotifcation(String postName){
    if(postNameMap.containsKey(postName)){
      postNameMap.remove(postName);
    }
  }
}