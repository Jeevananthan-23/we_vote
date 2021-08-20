import 'package:flutter/material.dart';
import 'package:we_vote/main.dart';

class Votingpage extends StatelessWidget {
  const Votingpage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Voting Page"),
      ),
      body: BodyLayout(),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/bjp-kamal-logo.png'),
        ),
        title: Text('BJP'),
        onTap: () => {
          showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                    backgroundColor: Colors.lightGreen,
                    title: Text("Your vote has been counted"),
                    content: Text("Thank you for Voting"),
                  )),
        },
      ),
      SizedBox(
        height: 15,
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage:
              AssetImage('assets/images/Indian National Congress.png'),
        ),
        title: Text('CONGRESS'),
        onTap: () => {
          showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                    backgroundColor: Colors.lightGreen,
                    title: Text("Your vote has been counted"),
                    content: Text("Thank you for Voting"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Done'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        },
                      ),
                    ],
                  )),
        },
      ),
      SizedBox(
        height: 15,
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/DMK_Flag.png'),
        ),
        title: Text('DMK'),
        onTap: () => {
          showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                    backgroundColor: Colors.lightGreen,
                    title: Text("Your vote has been counted"),
                    content: Text("Thank you for Voting"),
                  )),
        },
      ),
      SizedBox(
        height: 15,
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/ADMK LOG.png'),
        ),
        title: Text('ADMK'),
        onTap: () => {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    backgroundColor: Colors.lightGreen,
                    title: Text("Your vote has been counted"),
                    content: Text("Thank you for Voting"),
                  )),
        },
      ),
      SizedBox(
        height: 15,
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/Nota log.png'),
        ),
        title: Text('NOTA'),
        onTap: () => {
          showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                    backgroundColor: Colors.lightGreen,
                    title: Text("Your vote has been counted"),
                    content: Text("Thank you for Voting"),
                  )),
        },
      ),
    ],
  );
}
