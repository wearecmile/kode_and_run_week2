class Transaction {
  int? transactionId;
  String? id;
  int? amount;
  String? note;
  String? creationDateTime;
  String? mode;

  Transaction(
      {this.transactionId,
      this.id,
      this.amount,
      this.note,
      this.creationDateTime,
      this.mode});

  Transaction.fromJson(Map<String, dynamic> json) {
    transactionId = json['transsactionId'];
    id = json['id'];
    amount = json['amount'];
    note = json['note'];
    creationDateTime = json['creationDateTime'];
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transsactionId'] = this.transactionId;
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['note'] = this.note;
    data['creationDateTime'] = this.creationDateTime;
    data['mode'] = this.mode;
    return data;
  }
}
