class ModalAuthentication {
  bool? success;
  String? mess;

  ModalAuthentication({this.success, this.mess});

  ModalAuthentication.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    mess = json['mess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['mess'] = this.mess;
    return data;
  }
}
