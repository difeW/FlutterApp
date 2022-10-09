import 'package:flutter/material.dart';

class GotechshowDialog {
  static void dialogOneButton(
      Function? callBack, BuildContext context, String content) {
    showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: const Text("Thong bao"),
              content: Text(content),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Huy",
                      style: TextStyle(color: Colors.black),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      callBack!();
                    },
                    child: Text("OK")),
              ],
            )));
  }
}
