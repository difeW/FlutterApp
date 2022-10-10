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

  static void showLoaderDialog(BuildContext context, Function()? callback) {
    AlertDialog alert = AlertDialog(
      insetPadding: const EdgeInsets.all(100),
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            Container(
                margin: const EdgeInsets.only(top: 16),
                child: const Text("Authenticating...")),
            ElevatedButton(
                onPressed: (() => {callback!()}), child: Text("Cancel"))
          ],
        ),
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
