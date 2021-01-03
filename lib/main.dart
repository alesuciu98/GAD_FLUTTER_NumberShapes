import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: NumberShapes(),
  ));
}

class NumberShapes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Number  Shapes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String message;
  int number;
  String m = '';

  // ignore: non_constant_identifier_names
  void NumberShape() {
    if (number != null) {
      int ok1 = 0;
      int ok2 = 0;
      for (int i = 1; i < number; i++) {
        if (i * i == number) {
          ok1 = 1;
          break;
        }
      }
      for (int i = 1; i < number; i++) {
        if (i * i * i == number) {
          ok2 = 1;
          break;
        }
      }
      if (ok1 == 1 && ok2 == 1) {
        setState(() {
          _showDialog();
        });
      } else if (ok1 == 1) {
        setState(() {
          _showDialog1();
        });
      } else if (ok2 == 1) {
        setState(() {
          _showDialog2();
        });
      } else
        _showDialog3();
    }
  }

  void _showDialog() {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$number'),
          content: Text('Number $number is both SQUARE and TRIANGULAR!'),
        );
      },
    );
  }

  void _showDialog1() {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$number'),
          content: Text('Number $number is SQUARE!'),
        );
      },
    );
  }

  void _showDialog2() {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$number'),
          content: Text('Number $number is TRIANGULAR!'),
        );
      },
    );
  }

  void _showDialog3() {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$number'),
          content: Text('Number $number is neither TRIANGULAR OR SQUARE!'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
              child: Text(
                'Please input a number to see if it is square or triangular.',
                style: TextStyle(
                  letterSpacing: 1.0,
                  color: Colors.grey[850],
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(
                  letterSpacing: 1.0,
                  color: Colors.grey[850],
                  fontSize: 20.0,
                ),
                decoration: const InputDecoration(
                  hintText: 'Insert the number here',
                ),
                onChanged: (String value) {
                  setState(() {
                    message = value;
                  });
                },
                validator: (String value) {
                  if (value.contains('.') || value.contains(',') || value.contains('-') || value.contains(' ')) {
                    return 'Please Enter an Integer!';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.all_inclusive),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              setState(() {
                number = int.tryParse(message);
                NumberShape();
              });
            }
          },
        ),
      ),
    );
  }
}
