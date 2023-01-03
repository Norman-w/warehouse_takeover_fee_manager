import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

const users = {
  'admin': 'admin',
  'test': 'test',
};

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
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
      onLogin: _authUser,
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
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('hello!'),
            ),
          ),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}