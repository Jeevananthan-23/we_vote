import 'package:flutter/material.dart';
import 'package:we_vote/DATA/voter.dart';

class Voterlist extends StatelessWidget {
  const Voterlist({Key key}) : super(key: key);
  final primary = Colors.indigo;
  final secondary = Colors.black;
  final background = Colors.white10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Voter_list"),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white30,
            height: 1500.0,
            width: 500,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10),
                  height: 500,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: details.length,
                      itemBuilder: (BuildContext context, int index) {
                        return list(context, index);
                      }),
                )
              ],
            ),
          ),
        ));
  }

  Widget list(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        color: Colors.black12,
      ),
      width: double.infinity,
      height: 150,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(right: 15),
                child: Image(image: AssetImage('assets/images/user.png'))),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  details[index]['name'],
                  style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: secondary,
                      size: 20,
                    ),
                    Text("country"),
                    SizedBox(
                      width: 5,
                    ),
                    Text(details[index]['country'],
                        style: TextStyle(
                            color: primary, fontSize: 13, letterSpacing: .3)),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.cake_outlined,
                      color: secondary,
                      size: 20,
                    ),
                    Text("Age"),
                    SizedBox(
                      width: 5,
                    ),
                    Text(details[index]['Age'],
                        style: TextStyle(
                            color: primary, fontSize: 13, letterSpacing: .3)),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.format_list_numbered_sharp,
                      color: secondary,
                      size: 20,
                    ),
                    Text("voter_id no"),
                    SizedBox(
                      width: 5,
                    ),
                    Text(details[index]['voter_id no'],
                        style: TextStyle(
                            color: primary, fontSize: 13, letterSpacing: .3)),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.admin_panel_settings,
                      color: secondary,
                      size: 20,
                    ),
                    Text("adhar_no"),
                    SizedBox(
                      width: 5,
                    ),
                    Text(details[index]['adhar_no'],
                        style: TextStyle(
                            color: primary, fontSize: 13, letterSpacing: .3)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
