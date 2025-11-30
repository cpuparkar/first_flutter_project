import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List ofXO = List.generate(9, (_) => "");

  bool whosTurn = true;

  winDialog({required String whoWon}) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text("$whoWon won ")),
          content: Text("Do you want to restart the game ?"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ofXO = List.generate(9, (_) => "");
                setState(() {});
              },
              child: Text("Restart"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                ofXO = List.generate(9, (_) => "");
                setState(() {});
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  // List ofXo=["","","",""];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber, title: Text("Tic Tac Toe")),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),

          children: [
            for (int i = 0; i < ofXO.length; i++) ...{
              GestureDetector(
                onTap: () {
                  if (ofXO[i] == '') {
                    if (whosTurn) {
                      ofXO[i] = "X";
                      whosTurn = false;
                    } else {
                      ofXO[i] = 'O';
                      whosTurn = true;
                    }

                    //
                    if (ofXO[0] == "X" && ofXO[1] == "X" && ofXO[2] == "X" ||
                        ofXO[3] == "X" && ofXO[4] == "X" && ofXO[5] == "X" ||
                        ofXO[6] == "X" && ofXO[7] == "X" && ofXO[8] == "X" ||
                        ofXO[0] == "X" && ofXO[4] == "X" && ofXO[8] == "X" ||
                        ofXO[2] == "X" && ofXO[4] == "X" && ofXO[6] == "X" ||
                        ofXO[0] == "X" && ofXO[3] == "X" && ofXO[6] == "X" ||
                        ofXO[1] == "X" && ofXO[4] == "X" && ofXO[7] == "X" ||
                        ofXO[2] == "X" && ofXO[5] == "X" && ofXO[8] == "X") {
                      winDialog(whoWon: "X");
                    } else if (ofXO[0] == "O" &&
                            ofXO[1] == "O" &&
                            ofXO[2] == "O" ||
                        ofXO[3] == "O" && ofXO[4] == "O" && ofXO[5] == "O" ||
                        ofXO[6] == "O" && ofXO[7] == "0" && ofXO[8] == "O" ||
                        ofXO[0] == "O" && ofXO[4] == "O" && ofXO[8] == "O" ||
                        ofXO[2] == "O" && ofXO[4] == "O" && ofXO[6] == "O" ||
                        ofXO[0] == "O" && ofXO[3] == "O" && ofXO[6] == "O" ||
                        ofXO[1] == "O" && ofXO[4] == "O" && ofXO[7] == "O" ||
                        ofXO[2] == "O" && ofXO[5] == "O" && ofXO[8] == "O") {
                      winDialog(whoWon: "O");
                    }
                  }
                  setState(() {});
                },

                child: Container(
                  alignment: Alignment.center,

                  child: Text(
                    ofXO[i],
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  width: 100,
                  height: 100,
                ),
              ),
            },
          ],
        ),
      ),
    );
  }
}
