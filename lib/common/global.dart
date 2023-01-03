import 'package:flutter/foundation.dart';
import '../SDK/Model/Account.dart';

class AccountModel extends ChangeNotifier
{
  AccountModel();
  //region 用户当前的session
  String? _session;
  String? get session
  {
    return _session;
  }
  set session(String? value) {
    if (value != _session) {
      _session = value;
      notifyListeners();
    }
  }
  //endregion

  //region当前登录用户信息
  Account? _account;
  Account? get account => _account;
  set account(Account? value)
  {
    if(value!= _account)
      {
        _account = value;
        notifyListeners();
      }
  }
  //endregion
}