part of 'book_bloc.dart';

abstract class BookState extends Equatable {
  const BookState();
}

class BookInitial extends BookState {
  @override
  List<Object> get props => [];
}
final class LoadingBookState extends BookState{
  @override
  List<Object> get props => [];
}

final class LoadedBookState extends BookState{
  final SfPdfViewer book;
  const LoadedBookState({required this.book});
  @override
  List<Object> get props => [book];
}
final class ErrorBookState extends BookState{
  final String error;
  const ErrorBookState({required this.error});
  @override
  List<Object> get props => [error];
}
