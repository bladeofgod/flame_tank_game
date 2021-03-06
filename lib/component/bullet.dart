/*
* Author : LiJiqqi
* Date : 2020/7/29
*/

import 'package:flametankgame/component/base_component.dart';
import 'package:flametankgame/tank_game.dart';
import 'package:flutter/material.dart';

class Bullet with BaseComponent{
  final TankGame game;
  final double speed = 300;
  Offset position;
  double angle = 0;
  bool isOffScreen = false;

  Bullet(this.game,{this.position,this.angle});

  @override
  void render(Canvas canvas) {
    canvas.save();
    canvas.translate(position.dx, position.dy);
    canvas.rotate(angle);

    canvas.drawRect(
    Rect.fromLTWH(-10, -3, 16, 6), Paint()..color = Color(0xffff0000),);
    canvas.restore();
  }

  @override
  void update(double t) {
    if(isOffScreen)return;

    position = position + Offset.fromDirection(angle,speed * t);
    if (position.dx < -50) {
      isOffScreen = true;
    }
    if (position.dx > game.screenSize.width + 50) {
      isOffScreen = true;
    }
    if (position.dy < -50) {
      isOffScreen = true;
    }
    if (position.dy > game.screenSize.height + 50) {
      isOffScreen = true;
    }

  }







}






















