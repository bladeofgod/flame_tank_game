/*
* Author : LiJiqqi
* Date : 2020/7/28
*/

import 'dart:ui';

import 'package:flame/game/game.dart';

import 'component/tank.dart';

class TankGame extends Game{
  Size screenSize;

  Tank tank;

  @override
  void render(Canvas canvas) {
    if(screenSize == null)return;
    //绘制草坪
    canvas.drawRect(Rect.fromLTWH(0, 0, screenSize.width, screenSize.height)
        , Paint()..color = Color(0xff27ae60));
    //tank
    tank.render(canvas);
  }

  @override
  void update(double t) {
    if(screenSize == null)return;
    tank.update(t);
  }

  @override
  void resize(Size size) {
    screenSize = size;
    if(tank == null){
      tank = Tank(
        this,position: Offset(screenSize.width/2,screenSize.height/2),
      );
    }

  }

  void onLeftJoypadChange(Offset offset){
    if(offset == Offset.zero){
      tank.targetBodyAngle = null;
    }else{
      tank.targetBodyAngle = offset.direction;//范围（pi,-pi）
    }
  }

  void onRightJoypadChange(Offset offset) {
    if (offset == Offset.zero) {
      tank.targetTurretAngle = null;
    } else {
      tank.targetTurretAngle = offset.direction;
    }
  }

  void onFireButtonTap(){}


  
}














