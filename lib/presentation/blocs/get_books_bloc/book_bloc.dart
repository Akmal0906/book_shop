

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookInitial()) {
    on<GetBookEvent>(_getBook);
  }

  void _getBook(GetBookEvent event,Emitter<BookState> emit)async{
    try{
      emit(LoadingBookState());
      SfPdfViewer book= SfPdfViewer.network(event.url);
      emit(LoadedBookState(book: book));
    }catch(e){
      emit(ErrorBookState(error: e.toString()));

    }
  }

}
