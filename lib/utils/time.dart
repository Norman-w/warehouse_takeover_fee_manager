///将服务器返回的 yyyy-MM-dd HH:mm:ss.SSS格式转换成yyyy年MM月dd日
String timeStringToCNDay(String value)
{
  DateTime? time = DateTime.tryParse(value);
  return timeToCNDay(time);
}
String _fourDigits(int n) {
  int absN = n.abs();
  String sign = n < 0 ? "-" : "";
  if (absN >= 1000) return "$n";
  if (absN >= 100) return "${sign}0$absN";
  if (absN >= 10) return "${sign}00$absN";
  return "${sign}000$absN";
}
String _twoDigits(int n) {
  if (n >= 10) return "${n}";
  return "0${n}";
}
String timeToCNDay(DateTime? time)
{
  var ret = '';
  if(time!= null)
  {
    var local = time.toLocal();
    var year = local.year;
    var month = local.month;
    var day = local.day;
    return '${_fourDigits(year)}年${_twoDigits(month)}月${_twoDigits(day)}日';
  }
  return ret;
}