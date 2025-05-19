class Sale {
  int? id;
  int itemId;
  int quantity;
  double totalPrice;
  DateTime saleDate;

  Sale({
    this.id,
    required this.itemId,
    required this.quantity,
    required this.totalPrice,
    required this.saleDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'item_id': itemId,
      'quantity': quantity,
      'total_price': totalPrice,
      'sale_date': saleDate.toIso8601String(),
    };
  }

  factory Sale.fromMap(Map<String, dynamic> map) {
    return Sale(
      id: map['id'],
      itemId: map['item_id'],
      quantity: map['quantity'],
      totalPrice: map['total_price'],
      saleDate: DateTime.parse(map['sale_date']),
    );
  }
}
