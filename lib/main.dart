import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
//import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Retrieve Text Input',
      home: MyCustomForm(),
    );
  }
}

String _result = "";

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'image/index.png',
                height: 50,
                width: 150,
              ),
              Wrap(
                  direction: Axis.horizontal,
                  spacing: 8.0, // gap between adjacent chips
                  runSpacing: 4.0, // gap between lines
                  children: [
                    Text("TextOutput:",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(_result.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        )),
                  ]),
              SizedBox(
                height: 15.0,
              ),
              //Text(_result1),
              Container(
                margin: EdgeInsets.all(20.0),
                child: TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    //controller: myController2,
                    onChanged: (val) {
                      _onUpdate(val);
                    }),
              ),
              Text("Zuri Internship stage 2 task"),
              Center(
                child: Linkify(
                  text: "https://internship.zuri.team/",
                  options: LinkifyOptions(humanize: false),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onUpdate(String val) {
    setState(() {
      _result = val;
    });
  }
}
