import 'package:intl/intl.dart';
extension IntExt on int{
  String toTime({String formatStr = "yyyy-MM-DD HH:mm"}){
    var now = new DateTime.now();
    
    var format = new DateFormat(formatStr);
    var date = new DateTime.fromMicrosecondsSinceEpoch(this);
    print(date);
    var diff = date.difference(now);
    var time = '';

    if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0 || diff.inMinutes > 0 && diff.inHours == 0 || diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date); // Doesn't get called when it should be
    } else {
      time = diff.inDays.toString() + 'DAYS AGO'; // Gets call and it's wrong date
    }

    return time;
  }
}