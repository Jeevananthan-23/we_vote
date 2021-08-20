import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_vote/Screens/admin_signup.dart';
import 'package:we_vote/Services/blockchain.dart';
import 'Screens/admin.dart';
import 'Screens/voter_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'We vote',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Home page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://akm-img-a-in.tosshub.com/sites/btmt/images/stories/general-elections-2019-m_660_041819082725.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Welcome',
                  style: TextStyle(
                      // your text
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
              RaisedButton(
                child: Text('Admin'),
                onPressed: _showMaterialDialog,
              ),
              SizedBox(
                height: 15,
              ),
              RaisedButton(
                child: Text('Voter'),
                onPressed: _showCupertinoDialog,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Admin page"),
              content: new Text("Hey! Choose"),
              actions: <Widget>[
                FlatButton(
                  child: Text('Sign in'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Admin()),
                    );
                  },
                ),
                FlatButton(
                  child: Text('Sign up'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
                  },
                ),
              ],
            ));
  }

  _showCupertinoDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Voter page"),
              content: new Text("Now you can choose"),
              actions: <Widget>[
                new FlatButton(
                  child: Text('Voter page'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Voters()),
                    );
                  },
                ),
                FlatButton(
                  child: new Text('Vote Analysis'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Vote()),
                    );
                  },
                )
              ],
            ));
  }
}
