import 'package:flutter/material.dart';
import 'package:cc_rec/apps_screens/tile_state.dart';
import 'package:cc_rec/apps_screens/game_screen.dart';


class tilestwo extends StatelessWidget {
  final TileState tileState;
  final double dimension;
  final VoidCallback onPressed;

  tilestwo({required this.tileState, required this.dimension, required this.onPressed})
      : super(key:null);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: dimension,
        height: dimension,
        child: FlatButton(
          onPressed: onPressed,
          child: _widgetForTileState(),
        ));
  }

  Widget _widgetForTileState() {
   late Widget widget;

    switch (tileState) {
      case TileState.EMPTY:
        {
          widget = Container();
        }
        break;

      case TileState.CROSS:
        {
          widget = Image.asset('images/x.png');
        }
        break;

      case TileState.CIRCLE:
        {
          widget = Image.asset('images/o.png');
        }
        break;
    }

    return widget;
  }
}
