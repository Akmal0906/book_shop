import 'package:bloc/bloc.dart';
import 'package:book_shop/data/network/api.dart';
import 'package:book_shop/utils/resource/data_state.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../domain/models/categories/categories_model.dart';
import '../../../domain/models/categories_item/categories_item_model.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<TakeSearchItemEvent>(_takeSearchItem,
        transformer: debounceSequential(const Duration(seconds: 1)));
    on<TakeCategoryItemEvent>(_takeCategoryItem,
        transformer: debounceSequential(const Duration(seconds: 1)));
  }


  void _takeCategoryItem(
      TakeCategoryItemEvent event, Emitter<CategoryState> emit) async {
    try {
      emit(CategoryLoading());
      final FetchData fetchData = FetchData();
      final list = await fetchData.fetchItemModel(id: event.id);
      switch (list.runtimeType) {
        case const (DataSuccess):
          emit(CategoryLoaded(list.data));
          break;
        case const (DataIsEmpty):
          emit(EmptyState(list.data));
          break;
        case const (DataFailed):
          emit(ErrorState(list.error.toString()));
          break;
        default:
          print('SWITCHNING BIRONTASIGA TUSHMADI');
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
      print('Bloc Catch ishlavotti $e');
    }
  }

  void _takeSearchItem(
      TakeSearchItemEvent event, Emitter<CategoryState> emit) async {
    try {
      emit(CategoryLoading());
      final FetchData fetchData = FetchData();
      DataState? s;
      s = await fetchData.fetchSearchItem(event.name);
      print('BIZ  KUTYAPMIZ');
      switch (s.runtimeType) {
        case const (DataSuccess):
          emit(CategoryItemSearchState(s.data));
          break;
        case const (DataIsEmpty):
          emit(EmptyState(s.data));
          break;
        case const (DataFailed):
          emit(ErrorState(s.error.toString()));
          break;
        default:
          print('SWITCHNING BIRONTASIGA TUSHMADI');
      }
    } catch (e) {
      emit(const ErrorState('Error kevotti'));
    }
  }
}
 _takeBook(TakeBookEvent event,Emitter<CategoryState> emit)async*{
  emit(CategoryLoading());
  try{

  }catch(e){
     emit(ErrorState('dfgdfg'));
  }

}
EventTransformer<Event> debounceSequential<Event>(Duration duration) {
  print('debounceSequential TIME $duration');
  return (events, mapper) => events.debounceTime(duration).asyncExpand(mapper);
}

// @override
// Stream<SfPdfViewerState> mapEventToState(CategoryEvent event) async* {
//   if (event == CategoryEvent.loadPdf) {
//     yield SfPdfViewerState.loading();
//     try {
//       final pdfDocument = await PdfDocument.fromURL('https://example.com/sample.pdf');
//       yield SfPdfViewerState.loaded(pdfDocument);
//     } catch (e) {
//       yield SfPdfViewerState.error(e.toString());
//     }
//   }
// }