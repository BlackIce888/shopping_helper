import 'package:shopping_helper/src/Domain/Model/Entity/Product.dart';
import 'package:shopping_helper/src/Presentation/Framework/Actions/ProductActions.dart';
import 'package:shopping_helper/src/Presentation/Framework/Models/AppState.dart';

AppState appStateReducer(AppState state, action) {
    return AppState(
        productList: productReducer(state.productList, action),
    );
}

List<Product> productReducer(List<Product> state, action) {
    if (action is CreateProductAction) {
        return []
            ..addAll(state)
            ..add(action.product);
    }
    if (action is RemoveProductAction) {
        return List.unmodifiable(List.from(state)
            ..remove(action.product));
    }
    if (action is RemoveProductAction) {
        return List.unmodifiable([]);
    }

    return state;
}
