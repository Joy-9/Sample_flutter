import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'ScreenAdaper.dart';

class Tool {
  static init(context) {}
  // ignore: non_constant_identifier_names
  // static ShowToast(String description){
  //   return Fluttertoast.showToast(
  //       msg: "${description}",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //       backgroundColor: Colors.black54,
  //       textColor: Colors.white,
  //       fontSize: 16.0
  //   );
  // }

  // static TitleWidget(context,value){
  //   S.init(context);
  //   return Container(
  //     margin: EdgeInsets.all(S.width(20.0)),
  //     padding: EdgeInsets.only(left: S.width(10)),
  //     decoration: BoxDecoration(
  //         border: Border(
  //             left: BorderSide(
  //               color: Colors.red,
  //               width: S.width(4),
  //             )
  //         )
  //     ),
  //     child: Text(value,style: TextStyle(color: Colors.black54,fontSize: S.size(36)),),
  //   );
  // }

  static Loading() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              strokeWidth: 1.0,
            ),
          ],
        ),
      ),
    );
  }
}
