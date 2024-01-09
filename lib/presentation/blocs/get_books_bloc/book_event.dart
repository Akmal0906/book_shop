part of 'book_bloc.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();
}

final class GetBookEvent extends BookEvent {
  final String url;

  const GetBookEvent({required this.url});

  @override
  List<Object?> get props => [url];
}
