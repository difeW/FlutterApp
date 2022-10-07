import 'package:flutter/material.dart';
import 'package:gotech_app/modal/modal_detail_product.dart';
import 'package:gotech_app/responsive/api.dart';
import 'package:gotech_app/responsive/repo.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key, required this.id});
  final String id;

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  late Future<ModalDetailProduct> infoProduct;

  @override
  void initState() {
    // TODO: implement initState
    infoProduct = GotechRespontive.fetchGetDetailProduct(widget.id);
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
        ),
        body: Container(
          alignment: Alignment.center,
          child: FutureBuilder(
              future: infoProduct,
              builder: ((context, snapshot) {
                if (snapshot.hasData == true) {
                  ModalDetailProduct data = snapshot.data as ModalDetailProduct;
                  print(data.toJson());
                  return Text(data.prod!.ram!.capacity.toString());
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              })),
        ));
  }
}
