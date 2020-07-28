/*
* Author : LiJiqqi
* Date : 2020/7/28
*/

import 'dart:math';

import 'package:flutter/material.dart';

class Joypad extends StatefulWidget{

  final void Function(Offset) onchange;

  const Joypad({Key key, this.onchange}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return JoypadState();
  }

}

class JoypadState extends State<Joypad> {

  Offset delta = Offset.zero;

  void updateDelta(Offset newDelta){
    widget.onchange(newDelta);
    setState(() {
      delta = newDelta;
    });
  }

  void calculateDelta(Offset offset){
    Offset newDelta = offset - Offset(60,60);
    updateDelta(Offset.fromDirection(newDelta.direction,
      min(30, newDelta.distance)));
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,width: 120,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60)
        ),
        child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0x88ffffff),
              borderRadius: BorderRadius.circular(60),
            ),
            child: Center(
              child: Transform.translate(offset: delta,
              child: SizedBox(
                width: 60,height: 60,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xccffffff),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),),
            ),
          ),
          onPanDown: onDragDown,
          onPanUpdate: onDragUpdate,
          onPanEnd: onDragEnd,
        ),
      ),
    );
  }

  void onDragDown(DragDownDetails d) {
    calculateDelta(d.localPosition);
  }

  void onDragUpdate(DragUpdateDetails d) {
    calculateDelta(d.localPosition);
  }

  void onDragEnd(DragEndDetails d) {
    updateDelta(Offset.zero);
  }
}


























