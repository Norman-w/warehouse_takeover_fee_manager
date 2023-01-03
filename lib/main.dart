import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warehouse_takeover_fee_manager/common/global.dart';
import 'package:warehouse_takeover_fee_manager/pages/Login.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_)=>AccountModel(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '仓储托管费管理器',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const LoginScreen(),
    );
  }
}