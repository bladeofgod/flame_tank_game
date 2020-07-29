import 'package:flametankgame/tank_game.dart';
import 'package:flametankgame/widgets/fire_button.dart';
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

          Column(
            children: [

              Spacer(),
              //发射按钮
              Row(
                children: [
                  SizedBox(width: 48),
                  FireButton(
                    onTap: tankGame.onFireButtonTap,
                  ),
                  Spacer(),
                  FireButton(
                    onTap: tankGame.onFireButtonTap,
                  ),
                  SizedBox(width: 48),
                ],
              ),
              SizedBox(height: 20),
              //摇杆
              Row(
                children: [
                  SizedBox(width: 48),
                  Joypad(
                    onchange: (Offset delta)=>tankGame.onLeftJoypadChange(delta),
                  ),
                  Spacer(),
                  Joypad(
                    onchange: (Offset delta)=>tankGame.onRightJoypadChange(delta),
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
