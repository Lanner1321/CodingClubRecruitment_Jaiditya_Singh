import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cc_rec/apps_screens/board_tile.dart';
import 'package:cc_rec/apps_screens/tile_state.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(game());
}

class game extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _gameState();
}

class _gameState extends State<game> {
  final navigatorKey = GlobalKey<NavigatorState>();
  var _boardState = List.filled(9, TileState.EMPTY);

  var _currentTurn = TileState.CROSS;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Rules"),
          backgroundColor: Colors.red,
        ),
        body: Container(
          color: Colors.black,
          alignment: Alignment.center,
          child:Center(child:
              Stack(children: [Image.asset('images/image.png'), _Tiles()]),
        ),
      ),
    ));
  }

  Widget _Tiles() {
    return Builder(builder: (context) {
      final boardDimension = MediaQuery.of(context).size.width;
      final tileDimension = boardDimension / 3;

      return Container(
          width: boardDimension,
          height: boardDimension,
          child: Column(
              children: chunk(_boardState, 3).asMap().entries.map((entry) {
            final chunkIndex = entry.key;
            final tileStateChunk = entry.value;

            return Row(
              children: tileStateChunk.asMap().entries.map((innerEntry) {
                final innerIndex = innerEntry.key;
                final tileState = innerEntry.value;
                final tileIndex = (chunkIndex * 3) + innerIndex;

                return tilestwo(
                  tileState: tileState,
                  dimension: tileDimension,
                  onPressed: () => _turn(tileIndex),
                );
              }).toList(),
            );
          }).toList()));
    });
  }

  void _turn (int selectedIndex) {
    if (_boardState[selectedIndex] == TileState.EMPTY) {
      setState(() {
        _boardState[selectedIndex] = _currentTurn;
        _currentTurn = _currentTurn == TileState.CROSS
            ? TileState.CIRCLE
            : TileState.CROSS;
      });

      final winner = _Winner();
      if (winner != TileState.NULL) {
        print('Winner is: $winner');
        _WinnerDialog(winner);
      }
    }
  }

  TileState _Winner() {
    TileState Function(int, int, int) winnerForMatch = (a, b, c) {
      if (_boardState[a] != TileState.EMPTY) {
        if ((_boardState[a] == _boardState[b]) &&
            (_boardState[b] == _boardState[c])) {
          return _boardState[a];
        }
      }
      return TileState.NULL;
    };

    final checks = [
      winnerForMatch(0, 1, 2),
      winnerForMatch(3, 4, 5),
      winnerForMatch(6, 7, 8),
      winnerForMatch(0, 3, 6),
      winnerForMatch(1, 4, 7),
      winnerForMatch(2, 5, 8),
      winnerForMatch(0, 4, 8),
      winnerForMatch(2, 4, 6),
    ];

    late TileState winner;
    for (int i = 0; i < checks.length; i++) {
      if (checks[i] !=TileState.NULL) {
        winner = checks[i];
        break;
      }
    }

    return winner;
  }

  void _WinnerDialog(TileState tileState) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Winner'),
            content: Image.asset(
                tileState == TileState.CROSS ? 'images/x.png' : 'images/o.png'),
            actions: [
              FlatButton(
                  onPressed: () {
                    _resetGame();
                    Navigator.of(context).pop();
                  },
                  child: Text('New Game'))
            ],
          );
        });
  }

  void _resetGame() {
    setState(() {
      _boardState = List.filled(9, TileState.EMPTY);
      _currentTurn = TileState.CROSS;
    });
  }
}