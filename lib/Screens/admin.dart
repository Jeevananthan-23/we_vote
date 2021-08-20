import 'package:flutter/material.dart';
import 'package:we_vote/Screens/voter_list.dart';
import 'package:we_vote/Services/controls.dart';
import '../Services/blockchain.dart';

// ignore: must_be_immutable
class Admin extends StatelessWidget {
  var value;
  String email;
  String pwd;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Admin Page"),
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
                  child: Container(
                color: Colors.white60,
                width: 500.0,
                height: 300.0,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 35.0, left: 35.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: Colors.purple[900],
                          fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.purple[900],
                          ),
                          hintText: 'Enter your Email',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 35.0, left: 35.0),
                        child: TextFormField(
                          obscureText: true,
                          style: TextStyle(
                            color: Colors.purple[900],
                            fontFamily: 'OpenSans',
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.purple[900],
                            ),
                            hintText: 'Enter your Password',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onChanged: (val) {
                            value = val;
                          },
                        )),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: RaisedButton(
                          child: Text('Login',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          color: Colors.black87,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () => {
                                if (email == null || pwd == null)
                                  //   {
                                  //     showDialog(
                                  //         context: context,
                                  //         builder: (_) => AlertDialog(
                                  //               title: Text(
                                  //                   "please enter email id & pwd"),
                                  //             )),
                                  //   }
                                  // else if (email != null && pwd != null)

                                  {
                                    showDialog(
                                        context: context,
                                        builder: (_) => new AlertDialog(
                                              title: new Text("Hello!"),
                                              content: new Text(
                                                  "Now you can choose"),
                                              actions: <Widget>[
                                                new FlatButton(
                                                  child: Text('Voter list'),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Voterlist()),
                                                    );
                                                  },
                                                ),
                                                FlatButton(
                                                  child: new Text('Controls'),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Controls()),
                                                    );
                                                  },
                                                ),
                                                FlatButton(
                                                  child:
                                                      new Text('Add new voter'),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Voterlist()),
                                                    );
                                                  },
                                                ),
                                                FlatButton(
                                                  child:
                                                      new Text('Vote Analysis'),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Vote()),
                                                    );
                                                  },
                                                ),
                                              ],
                                            )),
                                  }
                              }),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text('Back',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        color: Colors.black87,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        onPressed: () => {
                          Navigator.pop(context),
                        },
                      ),
                    ),
                  ],
                ),
              )),
            )));
  }
}
