import 'package:bloc/bloc.dart';
import 'package:drotest/repository/store_repository.dart';
import 'package:drotest/view/store/bloc/bloc.dart';
import 'package:drotest/view/store/models/item_model.dart';
import 'package:stream_transform/stream_transform.dart';

const _duration = Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class CatalogSearchBloc extends Bloc<CatalogSearchEvent, CatalogSearchState> {
  CatalogSearchBloc({required this.githubRepository})
      : super(SearchStateEmpty()) {
    on<TextChanged>(_onTextChanged, transformer: debounce(_duration));
  }

  final StoreRepository githubRepository;

  void _onTextChanged(
    TextChanged event,
    Emitter<CatalogSearchState> emit,
  ) async {
    final searchTerm = event.text;

    if (searchTerm.isEmpty) return emit(SearchStateEmpty());

    emit(SearchStateLoading());

    try {
      final results = await githubRepository.search(searchTerm);
      emit(SearchStateSuccess(
          results.map((e) => Item.fromJson(e)).toList(), searchTerm));
    } catch (error) {
      emit(const SearchStateError('something went wrong'));
    }
  }
}
