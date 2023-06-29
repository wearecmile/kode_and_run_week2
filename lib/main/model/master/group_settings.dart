class GroupSettings {
  bool? onAbsentPay;
  bool? doesCaptainPays;

  GroupSettings({this.onAbsentPay, this.doesCaptainPays});

  GroupSettings.fromJson(Map<String, dynamic> json) {
    onAbsentPay = json['onAbsentPay'];
    doesCaptainPays = json['doesCaptainPays'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['onAbsentPay'] = this.onAbsentPay;
    data['doesCaptainPays'] = this.doesCaptainPays;
    return data;
  }
}
