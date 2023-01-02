// ignore_for_file: file_names

import 'BaseResponse.dart';

/// <summary>
/// 基础TOP请求类，存放一些通用的请求参数。
/// </summary>
abstract class BaseRequest<T extends BaseResponse> {
  dynamic parseResponse(dynamic rspJsonObj);

  Map<String, dynamic> getParameters();

  String getApiName();
}
