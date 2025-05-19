class Item {
  int? id;
  String name;
  String? description;
  int? supplierId;
  int quantity;
  double price;

  Item({
    this.id,
    required this.name,
    this.description,
    this.supplierId,
    this.quantity = 0,
    this.price = 0.0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'supplier_id': supplierId,
      'quantity': quantity,
      'price': price,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      supplierId: map['supplier_id'],
      quantity: map['quantity'],
      price: map['price'],
    );
  }
}
