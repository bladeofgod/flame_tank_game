import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();

  ///设置屏幕方向
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);

  ///禁止所有UI层（全面屏）
  await SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          //为游戏提供占位符
          Container(
            color: Color(0xff27ae60),
          ),
          //摇杆
          Container(),
        ],
      )));

}
