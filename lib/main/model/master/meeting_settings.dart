class MeetingSettings {
  bool? allAbsentsPay;
  bool? willCaptainPay;

  MeetingSettings({this.allAbsentsPay, this.willCaptainPay});

  MeetingSettings.fromJson(Map<String, dynamic> json) {
    allAbsentsPay = json['allAbsentsPay'];
    willCaptainPay = json['willCaptainPay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allAbsentsPay'] = this.allAbsentsPay;
    data['willCaptainPay'] = this.willCaptainPay;
    return data;
  }
}
