// O modelo de domínio é um modelo conceitual do domínio que incorpora
// comportamento e dados.

// Os dados podem ser representados por um conjunto de entidades junto
// com seus relacionamentos, enquanto o comportamento é codificado por
// alguma lógica de negócios para manipular essas entidades.

// A classe e sua extensão não têm dependências de nenhum objeto que
// viva fora da camada de domínio.

//
//

/// The ProductID is an important concept in our domain
/// so it deserves a type of its own
typedef ProductID = String;

// Example: 1
//
class Product {
  Product({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.availableQuantity,
  });

  final ProductID id;
  final String imageUrl;
  final String title;
  final double price;
  final int availableQuantity;

  // serialization code
  factory Product.fromMap(Map<String, dynamic> map, ProductID id) {
    return Product(
      id: id,
      imageUrl: map['imageUrl'],
      title: map['title'],
      price: map['price'],
      availableQuantity: map['availableQuantity'],
    );
  }

  Map<String, dynamic> toMap() {
    // ...
    return {};
  }
}

// Exemple: 2
//
class Cart {
  const Cart([this.items = const {}]);

  /// All the items in the shopping cart, where:
  /// - key: product ID
  /// - value: quantity
  final Map<ProductID, int> items;

  factory Cart.fromMap(Map<String, dynamic> map) {
    // ...
    return const Cart();
  }

  Map<String, dynamic> toMap() {
    // ...
    return {};
  }
}

/// Helper extension used to update the items in the shopping cart.
extension MutableCart on Cart {
  Cart addItem({required ProductID productId, required int quantity}) {
    final copy = Map<ProductID, int>.from(items);
    // * update item quantity. Read this for more details:
    // * https://codewithandrea.com/tips/dart-map-update-method/
    copy[productId] = quantity + (copy[productId] ?? 0);
    return Cart(copy);
  }

  Cart removeItemById(ProductID productId) {
    final copy = Map<ProductID, int>.from(items);
    copy.remove(productId);
    return Cart(copy);
  }
}
