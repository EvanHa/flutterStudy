import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  final FirebaseUser user;

  AccountPage(this.user);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  int post = 0;

  @override
  void initState() {
    super.initState();
    Firestore.instance.collection('post').where('email', isEqualTo: widget.user.email)
        .getDocuments()
        .then((querySnapshot) {
      setState(() {
        post = querySnapshot.documents.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
        title: Text(
            'Insta Clone',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
            IconButton(
                icon: Icon(Icons.exit_to_app),
                color: Colors.black,
                onPressed: _logout,
            )
        ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      SizedBox(
                        width: 80.0,
                        height: 80.0,
                        child: GestureDetector(
                          onTap: () => print('이미지 클릭'),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(widget.user.photoUrl),
                          ),
                        ),
                      ),
                      Container(
                          width: 80.0,
                          height: 80.0,
                          alignment: Alignment.bottomRight,
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 28.0,
                                height: 28.0,
                                child: FloatingActionButton(
                                  onPressed: null,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 25.0,
                                height: 25.0,
                                child: FloatingActionButton(
                                  onPressed: null,
                                  backgroundColor: Colors.blue,
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  Text(
                    widget.user.displayName,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight:FontWeight.bold, fontSize:18.0),)
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text('$post\n게시물',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('0\n팔로워',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('0\n팔로잉',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0)),
              ),
            ],
          ),
        ],

      )
    );
  }

  void _logout() async {
      print('out');
      await FirebaseAuth.instance.signOut();
      await _googleSignIn.signOut();
  }
}
