import 'package:my_shopping_helper/src/models/appState.dart';
import 'package:my_shopping_helper/src/actions/actions.dart';
import 'package:my_shopping_helper/src/models/item.dart';

AppState appStateReducer(AppState state, action) {
    return AppState(
        items: itemReducer(state.items, action),
    );
}

List<Item> itemReducer(List<Item> state, action) {
    if (action is CreateItemAction) {
        return []
            ..addAll(state)
            ..add(action.item);
    }
    if (action is RemoveItemAction) {
        return List.unmodifiable(List.from(state)..remove(action.item));
    }
    if (action is RemoveItemsAction) {
        return List.unmodifiable([]);
    }

    return state;
}

