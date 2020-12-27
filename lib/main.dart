import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Baslangic(),
    ),
  );
}

class Baslangic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade200,
      appBar: AppBar(
        title: Text('Zar Oyunu'),
        backgroundColor: Colors.pink.shade300,
      ),
      body: Center(
        child: RaisedButton(
          child: Text(
            'Başlat',
            style: TextStyle(
              color: Colors.pink.shade200,
              fontSize: 20.0,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Oyun()),
            );
          },
        ),
      ),
    );
  }
}

class Oyun extends StatefulWidget {
  @override
  _OyunState createState() => _OyunState();
}

class _OyunState extends State<Oyun> {
  int solZar = 1;
  int sagZar = 1;
  int leftZar = 1;
  int rightZar = 1;
  int sayac = 0;
  int toplam1 = 0;
  int toplam2 = 0;

  void degisen() {
    setState(() {
      solZar = Random().nextInt(6) + 1;
      sagZar = Random().nextInt(6) + 1;
      leftZar = Random().nextInt(6) + 1;
      rightZar = Random().nextInt(6) + 1;
      toplam1 += solZar + sagZar;
      toplam2 += leftZar + rightZar;
      sayac++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade200,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        title: Text(
          'Oyun Ekranı',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      degisen();
                    },
                    child: Image.asset('images/zar$solZar.png'),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      degisen();
                    },
                    child: Image.asset('images/zar$sagZar.png'),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      degisen();
                    },
                    child: Image.asset('images/zar$leftZar.png'),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      degisen();
                    },
                    child: Image.asset('images/zar$rightZar.png'),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
              ],
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.pink.shade200,
                ),
                title: Text('$toplam1'),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.pink.shade200,
                ),
                title: Text('$toplam2'),
              ),
            ),
            sayac == 6
                ? RaisedButton(
                    child: Text(
                      'Sıradaki Oyun',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.pink.shade200,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Baslangic()),
                      );
                    },
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
