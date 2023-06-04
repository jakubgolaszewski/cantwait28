import 'package:bloc/bloc.dart';
import 'package:cantwait28/models/item_model.dart';
import 'package:cantwait28/repository/items_repository.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this._itemsRepository)
      : super(DetailsState(itemModel: null, errorOccurred: false));

  final ItemsRepository _itemsRepository;

  Future<void> getItemWithID(String id) async {
    try {
      final itemModel = await _itemsRepository.get(id);
      emit(DetailsState(
        itemModel: itemModel,
        errorOccurred: false,
      ));
    } catch (error) {
      emit(
        DetailsState(itemModel: null, errorOccurred: true),
      );
    }
  }
}
