class RetailPrice {
  double amount;
  String currencyCode;

  RetailPrice({this.amount, this.currencyCode});

  RetailPrice.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currencyCode = json['currencyCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['currencyCode'] = this.currencyCode;
    return data;
  }
}
