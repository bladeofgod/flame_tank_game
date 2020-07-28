/*
* Author : LiJiqqi
* Date : 2020/7/28
*/

import 'dart:ui';

import 'package:flame/game/game.dart';

class TankGame extends Game{
  Size screenSize;

  @override
  void render(Canvas canvas) {
    if(screenSize == null)return;
  }

  @override
  void update(double t) {
    if(screenSize == null)return;
  }

  @override
  void resize(Size size) {
    screenSize = size;

  }


  
}














