import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/create_page.dart';

class HomePage extends StatefulWidget {
  final FirebaseUser user;

  HomePage(this.user);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Insta Clone',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
          child: SingleChildScrollView(
              child: Center(
                  child: Column(
                    children: <Widget>[
                      Text('Instagram에 오신것을 환영합니다.',
                        style: TextStyle(fontSize: 24.0),
                      ),
                      Padding(padding: EdgeInsets.all(8.0)),
                      Text('사진과 동영상을 보려면 팔로우 하세요.',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Padding(padding: EdgeInsets.all(16.0)),
                      SizedBox(
                        width: 260.0,
                        child: Card(
                          elevation: 4.0, // 그림자를 주고 싶을때 사용
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.all(1.0)),
                                SizedBox(
                                    width: 80.0,
                                    height: 80.0,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(widget.user.photoUrl),
                                    )
                                ),
                                Text(widget.user.email, style: TextStyle(fontWeight: FontWeight.bold),),
                                Text(widget.user.displayName),
                                Padding(padding: EdgeInsets.all(8.0)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                        width: 70.0,
                                        height: 70.0,
                                        child: Image.network('https://t1.daumcdn.net/cfile/tistory/24283C3858F778CA2E', fit: BoxFit.cover)
                                    ),
                                    Padding(padding: EdgeInsets.all(1.0)),
                                    SizedBox(
                                        width: 70.0,
                                        height: 70.0,
                                        child: Image.network('https://t1.daumcdn.net/cfile/tistory/24283C3858F778CA2E', fit: BoxFit.cover)
                                    ),
                                    Padding(padding: EdgeInsets.all(1.0)),
                                    SizedBox(
                                        width: 70.0,
                                        height: 70.0,
                                        child: Image.network('https://t1.daumcdn.net/cfile/tistory/24283C3858F778CA2E', fit: BoxFit.cover)
                                    )
                                  ],
                                ),
                                Padding(padding: EdgeInsets.all(4.0)),
                                Text('Facebook 친구'),
                                Padding(padding: EdgeInsets.all(4.0)),
                                RaisedButton(
                                  child: Text('팔로우'),
                                  color: Colors.blueAccent,
                                  textColor: Colors.white,
                                  onPressed: () {},
                                ),
                                Padding(padding: EdgeInsets.all(1.0)),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
              )
          )
      ),
    );
  }
}

