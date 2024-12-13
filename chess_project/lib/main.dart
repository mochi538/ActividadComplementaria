import 'package:flutter/material.dart';

class ChessBoard {
  final int size;
  Map<String, String> pieces = {};

  ChessBoard({this.size = 8});

  void addPiece(String piece, String position) {
    if (isValidPosition(position)) {
      pieces[position] = piece;
    }
  }

  void removePiece(String position) {
    pieces.remove(position);
  }

  void movePiece(String from, String to) {
    if (pieces.containsKey(from) && isValidPosition(to)) {
      pieces[to] = pieces[from]!;
      pieces.remove(from);
    }
  }

  bool isValidPosition(String position) {
    if (position.length != 2) return false;
    String col = position[0].toUpperCase();
    String row = position[1];
    return col.codeUnitAt(0) >= 65 && col.codeUnitAt(0) < 65 + size &&
        int.tryParse(row) != null &&
        int.parse(row) >= 1 && int.parse(row) <= size;
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ChessBoard board = ChessBoard();
  final TextEditingController inputController = TextEditingController();
  String message = "";

  void handleAction(String action) {
    List<String> parts = inputController.text.toUpperCase().split(" ");
    if (parts.length < 2) {
      setState(() => message = "Entrada inválida.");
      return;
    }

    String piece = parts[0];
    String from = parts[1];
    String to = parts.length > 2 ? parts[2] : "";

    setState(() {
      switch (action) {
        case "Añadir":
          board.addPiece(piece, from);
          message = "Pieza añadida.";
          break;
        case "Eliminar":
          board.removePiece(from);
          message = "Pieza eliminada.";
          break;
        case "Mover":
          board.movePiece(from, to);
          message = "Pieza movida.";
          break;
        default:
          message = "Acción desconocida.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Tablero de Ajedrez")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: inputController,
                decoration: InputDecoration(
                  labelText: "Ej: ♕ D1 D2 (Mover)",
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => handleAction("Añadir"),
                    child: Text("Añadir"),
                  ),
                  ElevatedButton(
                    onPressed: () => handleAction("Eliminar"),
                    child: Text("Eliminar"),
                  ),
                  ElevatedButton(
                    onPressed: () => handleAction("Mover"),
                    child: Text("Mover"),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(message),
              Expanded(
                child: ChessBoardWidget(board: board),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChessBoardWidget extends StatelessWidget {
  final ChessBoard board;

  ChessBoardWidget({required this.board});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: board.size,
      ),
      itemCount: board.size * board.size,
      itemBuilder: (context, index) {
        int row = index ~/ board.size + 1;
        int col = index % board.size;
        String position = "${String.fromCharCode(65 + col)}$row";
        String? piece = board.pieces[position];
        bool isLight = (row + col) % 2 == 0;

        return Container(
          color: isLight ? Colors.white : Colors.black,
          child: Center(
            child: Text(
              piece ?? "",
              style: TextStyle(
                fontSize: 24,
                color: isLight ? Colors.black : Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}

void main() {
  runApp(MyApp());
}
