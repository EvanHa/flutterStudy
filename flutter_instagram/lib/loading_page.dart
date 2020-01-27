import 'package:flutter/material.dart';

// 상태 변경 요소가 없다면 StatefulWidget보다 StatelessWidget이 성능적으로 유리함

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(),
    );
  }
}
