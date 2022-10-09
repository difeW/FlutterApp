import 'package:flutter/material.dart';
import 'package:gotech_app/core/dialog/dialog.dart';

import '../../../router/router_manager.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key, required this.id, this.callBack});
  final String id;
  final Function? callBack;
  void callCallback() {
    callBack;
  }

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  void initState() {
    // infoProduct = GotechRespontive.fetchGetDetailProduct(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "DETAIL PRODUCT",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
              icon: const Icon(Icons.back_hand),
              onPressed: () {
                widget.callBack!("da pop");
                Navigator.pop(context);
              }),
        ),
        body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Center(
                  child: Text(widget.id),
                ),
                ElevatedButton(
                  child: const Text("add to cart"),
                  onPressed: () {
                    GotechshowDialog.dialogOneButton(() {
                      Navigator.pushNamed(context, RouteManager.cart);
                    }, context,
                        "San pham da duoc them vao gio hang, ban co muon di den gio hang? ");
                  },
                ),
              ],
            )));
  }
}
