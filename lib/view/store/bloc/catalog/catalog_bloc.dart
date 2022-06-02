import 'package:bloc/bloc.dart';
import 'package:drotest/repository/store_repository.dart';
import 'package:drotest/view/store/models/store_model.dart';
import 'package:equatable/equatable.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc({required this.shoppingRepository}) : super(CatalogLoading()) {
    on<CatalogStarted>(_onStarted);
  }

  final StoreRepository shoppingRepository;

  void _onStarted(CatalogStarted event, Emitter<CatalogState> emit) async {
    emit(CatalogLoading());
    try {
      final catalog = await shoppingRepository.loadCatalog();
      final categories = await shoppingRepository.loadCategories();
      emit(CatalogLoaded(Catalog(items: catalog, categories: categories)));
    } catch (_) {
      emit(CatalogError());
    }
  }
}
