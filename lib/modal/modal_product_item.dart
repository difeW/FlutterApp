class ModalProductItem {
  String? picture;
  String? productName;
  int? mSRP;
  int? unitPrice;
  String? id;

  ModalProductItem(
      {this.picture, this.productName, this.mSRP, this.unitPrice, this.id});

  ModalProductItem.fromJson(Map<String, dynamic> json) {
    picture = json['Picture'];
    productName = json['ProductName'];
    mSRP = json['MSRP'];
    unitPrice = json['UnitPrice'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Picture'] = picture;
    data['ProductName'] = productName;
    data['MSRP'] = mSRP;
    data['UnitPrice'] = unitPrice;
    data['id'] = id;
    return data;
  }
}
