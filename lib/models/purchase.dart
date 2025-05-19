class Purchase {
  int? id;
  int itemId;
  int quantity;
  double totalPrice;
  DateTime purchaseDate;

  Purchase({
    this.id,
    required this.itemId,
    required this.quantity,
    required this.totalPrice,
    required this.purchaseDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'item_id': itemId,
      'quantity': quantity,
      'total_price': totalPrice,
      'purchase_date': purchaseDate.toIso8601String(),
    };
  }

  factory Purchase.fromMap(Map<String, dynamic> map) {
    return Purchase(
      id: map['id'],
      itemId: map['item_id'],
      quantity: map['quantity'],
      totalPrice: map['total_price'],
      purchaseDate: DateTime.parse(map['purchase_date']),
    );
  }
}
