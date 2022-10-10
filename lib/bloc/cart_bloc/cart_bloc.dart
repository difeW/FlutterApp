import 'package:gotech_app/bloc/cart_bloc/model_cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Cubit<List<ModelCartBloc>> {
  CartBloc(super.initialState);
  List<ModelCartBloc> list = [];
  void addItem(String id) {
    List<ModelCartBloc> nl = [];
    list.add(ModelCartBloc(id: id));
    nl = [...list];
    emit(nl);
  }

  void deleteItem(String id) {
    for (int i = 0; i < list.length; i++) {
      if (list[i].id == id) {
        list.removeAt(i);
        break;
      }
    }
    List<ModelCartBloc> nl = [...list];
    emit(nl);
  }
}
