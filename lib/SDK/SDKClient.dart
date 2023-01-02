import 'dart:async';
import 'dart:convert';
import 'BaseRequest.dart';
import 'BaseResponse.dart';
import 'package:http/http.dart' as http;

enum Method
{
  get,post,put,delete
}

class SDKClient
{
  //全局变量
  final String url;
  Duration? timeout;

  //构造函数
  SDKClient(this.url, {this.timeout});
  Future<T> execute<T extends BaseResponse>({required BaseRequest<T> request, String? session,Method? method}) async {
    var uri = buildGetUri(request, session);
    print('get请求的uri');print(uri);
    final response =
    method == Method.get?
    await http.get(uri):
        method == Method.post?
        await http.post(uri):
            method == Method.delete?
            await http.delete(uri):
                method == Method.put?
                await http.put(uri):
                    await http.get(uri);
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);
      T rsp = request.parseResponse(decoded);
      return rsp;
    } else {
      throw Exception('Failed to load post~~~~~');
    }
  }
  //get请求链接拼接方法
  Uri buildGetUri<T extends BaseResponse>(BaseRequest<T> request, String? session)
  {
    //先根据给定的基础url来创建uri
    //根据request的参数列表来填写uri中的parameters
    var json = request.getParameters();
    //把string dynamic的字典转换成string string的
    var query = "${"method=${request.getApiName()}"}&session=$session";

    json.forEach((key, value) {
      if(value != null)
        {
          // if(query.length>0){
            query += "&";
          // }
          query += "$key=$value";
        }
    });

    //加入到uri中.
    Uri uri = Uri.parse(url + query);
    return uri;
  }
}


