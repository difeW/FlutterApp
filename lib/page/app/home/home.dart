import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotech_app/bloc/cart_bloc/cart_bloc.dart';
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
          child: SizedBox(
        width: size,
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: FutureBuilder(
                future: _listHotSale,
                builder: ((context, snapshot) {
                  if (snapshot.hasData == true) {
                    final list = snapshot.data as List<ModalProductItem>;
                    return _buildListItemProduct(list, context, size, sizeh);
                  } else {
                    return _loadinglistItem(sizeh);
                  }
                }))),
      )),
    );
  }

  SizedBox _loadinglistItem(double sizeh) {
    return SizedBox(
      height: sizeh,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  SingleChildScrollView _buildListItemProduct(List<ModalProductItem> list,
      BuildContext context, double size, double sizeh) {
    ValueNotifier<String> selected = ValueNotifier("");
    return SingleChildScrollView(
      child: Wrap(
          children: list
              .map((e) => AnimatedBuilder(
                    animation: selected,
                    builder: (_, __) => CardButton(
                      backgroundColor:
                          selected.value == e.id ? Colors.red : Colors.white,
                      onTap: () {
                        Navigator.pushNamed(context, RouteManager.detailProduct,
                            arguments: DataSendDetailProduct(
                                id: e.id,
                                callBack: (String string) {
                                  selected.value = e.id ?? "";
                                }));
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
                            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "${oCcy.format(e.mSRP)} đ",
                                style: const TextStyle(
                                    fontSize: 11,
                                    decoration: TextDecoration.lineThrough),
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
                          const SizedBox(
                            height: 16,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                context.read<CartBloc>().addItem(e.id ?? "");
                              },
                              child: const Text("Add to cart")),
                        ]),
                      ),
                    ),
                  ))
              .toList()),
    );
  }

  AppBar _appbar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 179, 60, 0),
      title: Text(
        "HOME ${context.watch<CartBloc>().state.length}",
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
        (index) => const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      ),
    );
  }
}

class DataSendDetailProduct {
  final String? id;
  final Function? callBack;
  DataSendDetailProduct({this.id, this.callBack});
}
