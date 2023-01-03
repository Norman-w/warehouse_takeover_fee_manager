import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:provider/provider.dart';
import 'package:warehouse_takeover_fee_manager/SDK/API/User/AccountLoginByPassRequest.dart';
import 'package:warehouse_takeover_fee_manager/SDK/SDKClient.dart';
import 'package:warehouse_takeover_fee_manager/common/global.dart';

import 'home.dart';

const users = {
  'admin': 'admin',
  'test': 'test',
};

var sdkClient = SDKClient("https://enni.group/netserver/router.aspx?");

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data,BuildContext context) {
    var req = AccountLoginByPassRequest();
    req.NickMobileId = data.name;
    req.Pass = data.password;
    var rsp = sdkClient.execute(request: req);
    return rsp.then((res) {
      var session = res.Session;
      if (session != null && session.isNotEmpty) {
        var model = context.read<AccountModel>();
        model.account = res.account;
        model.session = session;
        return null;
      }
      else {
        return "登录失败,请检查用户名密码";
      }
    });
  }

  // Future<String?> _signupUser(SignupData data) {
  //   debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
  //   return Future.delayed(loginTime).then((_) {
  //     return null;
  //   });
  // }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      userType: LoginUserType.name,
      userValidator:(value){
        if(value == null || value.length<3) {
        return "无效的用户名";
      } else {
        return null;
      }},
      title: 'ENNI E-Commerce',
      logo: const AssetImage('assets/images/enni.png'),
      onLogin: (data){return _authUser(data,context);},
      // onSignup: _signupUser,
      hideForgotPasswordButton: true,
      messages: LoginMessages(
        flushbarTitleError: '错误',
        userHint:'用户名',
        passwordHint:'密码',
          loginButton:"登录",
      ),
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Home(),
              // child: Text('hello! ''${context.watch<AccountModel>().account?.Name}'),
            ),
          ),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}