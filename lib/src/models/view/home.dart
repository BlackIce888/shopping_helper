import 'package:my_shopping_helper/src/actions/actions.dart';
import 'package:my_shopping_helper/src/models/appState.dart';
import 'package:my_shopping_helper/src/models/item.dart';
import 'package:redux/redux.dart';

class HomeViewModel {
    final String pageTitle = 'Shopping List';
    final List<Item> items;
    final Function() onAddItem;
    final Function(Item) onRemoveItem;
    final Function() onRemoveItems;

    HomeViewModel({
        this.items,
        this.onAddItem,
        this.onRemoveItem,
        this.onRemoveItems
    });

    factory HomeViewModel.create(Store<AppState> store) {
        _onRemoveItem(Item item) {
            store.dispatch(RemoveItemAction(item));
        }
        _onRemoveItems() {
            store.dispatch(RemoveItemsAction());
        }
        return HomeViewModel (
            items: store.state.items,
            onRemoveItem: _onRemoveItem,
            onRemoveItems: _onRemoveItems,
        );
    }
}