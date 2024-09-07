class RetailPrice {
  String? amount;

  RetailPrice({this.amount});

  factory RetailPrice.fromJson(Map<String, dynamic> json) {
    return RetailPrice(
      amount: json['amount'] != null ? json['amount'].toString() : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'amount': amount,
  };
}
