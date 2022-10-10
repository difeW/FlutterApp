import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:gotech_app/bloc/cart_bloc/cart_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<CartBloc>(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
              title: Text("Cart ${context.watch<CartBloc>().list.length}")),
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: ListView(
              children: context
                  .watch<CartBloc>()
                  .state
                  .map((e) => Card(
                        color: Colors.amber,
                        child: Stack(children: [
                          Container(
                            height: 100,
                            child: Center(
                              child: Text(e.id ?? ""),
                            ),
                          ),
                          Positioned(
                            right: 8,
                            top: 8,
                            child: IconButton(
                              onPressed: () {
                                context.read<CartBloc>().deleteItem(e.id ?? "");
                              },
                              icon: const Icon(Icons.close),
                            ),
                          )
                        ]),
                      ))
                  .toList(),
            ),
          ),
        );
      }),
    );
  }
}
