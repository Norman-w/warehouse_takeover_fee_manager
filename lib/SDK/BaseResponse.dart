// ignore_for_file: non_constant_identifier_names, file_names
abstract class BaseResponse {
  /// <summary>
  /// 错误码
  /// </summary>
  String? ErrCode;

  /// <summary>
  /// 错误信息
  /// </summary>
  String? ErrMsg;

  /// <summary>
  /// 子错误码
  /// </summary>
  String? SubErrCode;

  /// <summary>
  /// 子错误信息
  /// </summary>
  String? SubErrMsg;

  /// <summary>
  /// 响应原始内容
  /// </summary>
  String? Body;

  BaseResponse(
      {this.ErrCode, this.ErrMsg, this.SubErrCode, this.SubErrMsg, this.Body});

  /// <summary>
  /// 响应结果是否错误
  /// </summary>
  bool get IsError {
    return ErrCode?.isNotEmpty ??
        SubErrCode?.isNotEmpty ??
        ErrMsg?.isNotEmpty ??
        SubErrMsg?.isNotEmpty ??
        false;
  }
}

class EmptyResponse extends BaseResponse
{
  EmptyResponse()
  {
    ErrMsg = "未实例化的Response";
  }
}
