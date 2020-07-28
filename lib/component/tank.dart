/*
* Author : LiJiqqi
* Date : 2020/7/28
*/

import 'dart:ui';

import 'package:flametankgame/component/base_component.dart';
import 'package:flametankgame/tank_game.dart';

class Tank with BaseComponent{

  final TankGame game;
  Offset position = Offset.zero;
  double bodyAngle = 0;
  double turretAngle = 0;

  Tank(this.game,{this.position});



  @override
  void render(Canvas canvas) {
    Paint lightPaint = Paint()
        ..color= Color(0xffdddddd);
    Paint darkPaint = Paint()..color = Color(0xff777777);
    //将canvas 原点设置在tank上
    canvas.save();
    canvas.translate(position.dx, position.dy);

    //绘制tank身体
    canvas.drawRect(Rect.fromLTWH(-20, -15, 40, 30), lightPaint);

    //绘制轮子
    canvas.drawRect(Rect.fromLTWH(-24, -23, 48, 8), darkPaint);
    canvas.drawRect(
      Rect.fromLTWH(-24, 15, 48, 8),
      darkPaint,
    );
    // 绘制炮塔
    canvas.drawRect(
      Rect.fromLTWH(-10, -12, 25, 24),
      darkPaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(0, -3, 36, 6),
      darkPaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(36, -5, 6, 10),
      darkPaint,
    );
    canvas.restore();


  }

  @override
  void update(double t) {
    // TODO: implement update
  }

}











