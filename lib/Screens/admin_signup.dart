import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Admin Page"),
      ),
      body: new Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://akm-img-a-in.tosshub.com/sites/btmt/images/stories/general-elections-2019-m_660_041819082725.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: new Center(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(height: 10.0),
                Container(
                  child: TextField(
                    keyboardType: TextInputType.name,
                    style: TextStyle(
                      color: Colors.purple[900],
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(
                        Icons.admin_panel_settings,
                        color: Colors.purple[900],
                      ),
                      hintText: 'Enter your name',
                    ),
                  ),
                ),
                Container(
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: Colors.purple[900],
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.purple[900],
                      ),
                      hintText: 'Enter your Email',
                    ),
                  ),
                ),
                Container(
                    child: TextField(
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.purple[900],
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.purple[900],
                    ),
                    hintText: 'Enter your Password',
                  ),
                )),
                Container(
                    child: TextField(
                  style: TextStyle(
                    color: Colors.purple[900],
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.purple[900],
                    ),
                    hintText: 'Coniform your Password',
                  ),
                )),
                Container(
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(),
                    style: TextStyle(
                      color: Colors.purple[900],
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(
                        Icons.mobile_friendly,
                        color: Colors.purple[900],
                      ),
                      hintText: 'mobile number',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text('Add',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    color: Colors.black87,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    onPressed: () => {
                      showDialog(
                          context: context,
                          builder: (_) => new AlertDialog(
                                title: new Text("Added Succesfully Done😎"),
                              ))
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text('Back',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    color: Colors.black87,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    onPressed: () => {
                      Navigator.pop(
                        context,
                      ),
                    },
                  ),
                ),
              ],
            ),
          )),
    ));
  }
}
