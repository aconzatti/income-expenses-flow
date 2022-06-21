// O modelo de domínio é um modelo conceitual do domínio que incorpora
// comportamento e dados.

// Os dados podem ser representados por um conjunto de entidades junto
// com seus relacionamentos, enquanto o comportamento é codificado por
// alguma lógica de negócios para manipular essas entidades.

// A classe e sua extensão não têm dependências de nenhum objeto que
// viva fora da camada de domínio.

//
//

/*
Aqui estão algumas dicas que você pode usar ao projetar e criar seus aplicativos:

- explore o modelo de domínio e descubra quais conceitos e comportamentos você 
precisa representar

- expressar esses conceitos como entidades junto com seus relacionamentos

- implementar as classes de modelo Dart correspondentes

- traduzir os comportamentos em código de trabalho (lógica de negócios) que 
opera nessas classes de modelo

- adicione testes de unidade para verificar se os comportamentos foram 
implementados corretamente

Ao fazer isso, pense em quais dados você precisa mostrar na interface do 
usuário e como o usuário irá interagir com eles.

Mas não se preocupe sobre como as coisas se conectam ainda. Na verdade, 
é trabalho dos serviços na camada de aplicação trabalhar com os modelos 
mediando entre os repositórios na camada de dados e os controladores na 
camada de apresentação.

*/

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
