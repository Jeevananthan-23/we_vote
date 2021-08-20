import 'package:flutter/material.dart';

class Controls extends StatelessWidget {
  const Controls({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Voting Page"),
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
              Text('Events',
                  style: TextStyle(
                      // your text
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
              RaisedButton(
                child: Text('Start vote'),
                onPressed: () => {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            backgroundColor: Colors.lightGreen,
                            title: Text("vote started"),
                          )),
                },
              ),
              SizedBox(
                height: 15,
              ),
              RaisedButton(
                child: Text('End vote'),
                onPressed: () => {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            backgroundColor: Colors.lightGreen,
                            title: Text("vote ented"),
                          )),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
