Duration durationFromMillseconds(int milliseconds)=>
  Duration(milliseconds: milliseconds);

int durationToMilliseconds(Duration duration) => duration.inMilliseconds;

DateTime datetimeFromEpochMilliseconds(int us) => 
  DateTime.fromMillisecondsSinceEpoch(us);
int dateTimeToEpochMillseconds(DateTime dateTime) => dateTime.millisecondsSinceEpoch;
