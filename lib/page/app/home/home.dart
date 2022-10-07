import 'package:flutter/material.dart';
import 'package:gotech_app/modal/modal_product_item.dart';
import 'package:gotech_app/responsive/repo.dart';
import 'package:gotech_app/router/router_manager.dart';
import 'package:gotech_app/widget/card_button.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<ModalProductItem>> _listHotSale;
  final oCcy = NumberFormat("#,##0", "en_US");
  @override
  void initState() {
    // TODO: implement initState
    _listHotSale = GotechRespontive.fetchGetListProductItemHotSale();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    final sizeh = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: _appbar(),
      body: SingleChildScrollView(
          child: Container(
        width: size,
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: FutureBuilder(
                future: _listHotSale,
                builder: ((context, snapshot) {
                  if (snapshot.hasData == true) {
                    final list = snapshot.data as List<ModalProductItem>;
                    return SingleChildScrollView(
                      child: Wrap(
                          children: list
                              .map((e) => CardButton(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, RouteManager.detailProduct,
                                          arguments: e.id);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                      ),
                                      width: size > sizeh
                                          ? size / 4 - 16 * 2 + 8 + 4
                                          : size / 2 - 16 * 2 + 8,
                                      height: 300,
                                      child: Column(children: [
                                        Image.network(
                                          e.picture ?? "",
                                          height: 100,
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Text(
                                            e.productName ?? "",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "${oCcy.format(e.mSRP)} đ",
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                            ),
                                            Text(
                                              "${oCcy.format(e.unitPrice)} đ",
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        _star(),
                                      ]),
                                    ),
                                  ))
                              .toList()),
                    );
                  } else {
                    return SingleChildScrollView(
                      child: Wrap(children: [Text("khong data")]),
                    );
                  }
                }))),
      )),
    );
  }

  AppBar _appbar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 179, 60, 0),
      title: const Text(
        "HOME",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }

  Widget _star() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      ),
    );
  }
}
