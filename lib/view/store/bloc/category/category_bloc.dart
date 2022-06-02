import 'package:bloc/bloc.dart';
import 'package:drotest/repository/store_repository.dart';
import 'package:drotest/view/store/bloc/category/category_event.dart';
import 'package:drotest/view/store/bloc/category/category_state.dart';
import 'package:drotest/view/store/models/item_model.dart';
import 'package:stream_transform/stream_transform.dart';

const _duration = Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({required this.githubRepository})
      : super(CategoryStateEmpty()) {
    on<TextChanged>(_onTextChanged, transformer: debounce(_duration));
  }

  final StoreRepository githubRepository;

  void _onTextChanged(
    TextChanged event,
    Emitter<CategoryState> emit,
  ) async {
    final searchTerm = event.text;

    if (searchTerm.isEmpty) return emit(CategoryStateEmpty());

    emit(CategoryStateLoading());

    try {
      final results = await githubRepository.getCategory(searchTerm);
      emit(CategoryStateSuccess(
          results.map((e) => Item.fromJson(e)).toList(), searchTerm));
    } catch (error) {
      emit(const CategoryStateError('something went wrong'));
    }
  }
}
