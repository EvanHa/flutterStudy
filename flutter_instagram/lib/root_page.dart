import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/login_page.dart';
import 'package:flutter_instagram/tab_page.dart';
import 'package:flutter_instagram/loading_page.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 로그인 정보가 있으면 탭페이지로 가고, 없으면 로그인 페이지로 간
    return _handleRootPage();
  }

  Widget _handleRootPage() {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage();
        } else {
          // snapshot에는 유저 정보가 들어있음. 로그인 성공하면 데이터가 있음
          if (snapshot.hasData) {
            print('1');
            return TabPage(snapshot.data);
          } else {
            print('2');
            return LoginPage();
          }
        }
      },
    );
  }
}
