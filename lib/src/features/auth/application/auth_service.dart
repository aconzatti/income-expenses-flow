/*
Concluímos agora nossa visão geral da camada de aplicativo. 
Como havia muito a cobrir, um breve resumo está em ordem.

Se você estiver escrevendo alguma lógica que:

depende de várias fontes de dados ou repositórios
precisa ser usado (compartilhado) por mais de um widget
Então considere escrever uma classe de serviço para ele. 
Ao contrário dos controladores que estendem o StateNotifier, 
as classes de serviço não precisam gerenciar nenhum estado, 
pois mantêm uma lógica que não é específica do widget.

As classes de serviço também não se preocupam com a serialização 
de dados ou como obter dados do mundo exterior (é para isso que 
serve a camada de dados).

Por último, as classes de serviço são muitas vezes desnecessárias. 
Não faz sentido criar uma classe de serviço se tudo o que ela faz é encaminhar chamadas de método de um controlador para um repositório. Nesse caso, o controlador pode depender do repositório e chamar seus métodos diretamente. Em outras palavras, a camada de aplicação é opcional.

Finalmente, se você estiver seguindo a estrutura de projeto de 
primeiro recurso descrita aqui, você deve decidir se precisa de 
classes de serviço com base em recurso por recurso.

*/

import 'package:income_expenses_flow/src/features/auth/domain/auth_model.dart';

///
///
///  SERVICE
///
class CartService {
  CartService({
    required this.authRepository,
    required this.localCartRepository,
    required this.remoteCartRepository,
  });
  final AuthRepository authRepository;
  final LocalCartRepository localCartRepository;
  final RemoteCartRepository remoteCartRepository;

  /// fetch the cart from the local or remote repository
  /// depending on the user auth state
  Future<dynamic> _fetchCart() {
    final user = authRepository.read(authRepositoryProvider).currentUser;
    if (user != null) {
      return remoteCartRepository
          .read(remoteCartRepositoryProvider)
          .fetchCart(user.uid);
    } else {
      return localCartRepository.read(localCartRepositoryProvider).fetchCart();
    }
  }

  /// save the cart to the local or remote repository
  /// depending on the user auth state
  Future<void> _setCart(Cart cart) async {
    final user = authRepository.read(authRepositoryProvider).currentUser;
    if (user != null) {
      await remoteCartRepository
          .read(remoteCartRepositoryProvider)
          .setCart(user.uid, cart);
    } else {
      await localCartRepository.read(localCartRepositoryProvider).setCart(cart);
    }
  }

  /// adds an item to the local or remote cart
  /// depending on the user auth state
  Future<void> addItem(Item item) async {
    // 1. fetch the cart
    final cart = await _fetchCart();
    // 2. return a copy with the updated data
    final updated = cart.addItem(item);
    // 3. set the cart with the updated data
    await _setCart(updated);
  }

  /// removes an item from the local or remote cart depending on the user auth
  /// state
  Future<void> removeItemById(String productId) async {
    // business logic
    final cart = await _fetchCart();
    final updated = cart.removeItemById(productId);
    await _setCart(updated);
  }

  /// sets an item in the local or remote cart depending on the user auth state
  Future<void> setItem(Item item) async {
    final cart = await _fetchCart();
    final updated = cart.setItem(item);
    await _setCart(updated);
  }
}


/*
///
///
///  PROVIDER
///
final cartServiceProvider = Provider<CartService>((ref) {
  return CartService(
    authRepository: ref.watch(authRepositoryProvider),
    localCartRepository: ref.watch(localCartRepositoryProvider),
    remoteCartRepository: ref.watch(remoteCartRepositoryProvider),
  );
});

*/