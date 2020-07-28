import 'package:flametankgame/tank_game.dart';
import 'package:flametankgame/widgets/joypad.dart';
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

  ///游戏
  final TankGame tankGame = TankGame();

  runApp(Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [

          tankGame.widget,
          //摇杆
          Column(
            children: [

              Spacer(),
              Row(
                children: [
                  SizedBox(width: 48),
                  Joypad(
                    onchange: (Offset delta)=>print(delta),
                  ),
                  Spacer(),
                  Joypad(
                    onchange: (Offset delta)=>print(delta),
                  ),
                  SizedBox(width: 48)
                ],
              ),
              SizedBox(height: 24)
            ],
          ),
        ],
      )));

}
