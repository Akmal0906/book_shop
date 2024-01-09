import 'package:book_shop/presentation/blocs/get_books_bloc/book_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemBookScreen extends StatefulWidget {
  const ItemBookScreen({super.key});

  @override
  State<ItemBookScreen> createState() => _ItemBookScreenState();
}

class _ItemBookScreenState extends State<ItemBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BookBloc, BookState>(
        builder: (BuildContext context, BookState state) {
          if (state is BookInitial) {
            print('BookInitial');
            return const Center(
              child: Text('INITIAL STATE'),
            );
          } else if (state is LoadingBookState) {
            print('LoadingBookState');
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedBookState) {
            print('LoadedBookState');
            return state.book;
          } else if (state is ErrorBookState) {
            print('ErrorBookState');
            return Center(
              child: Text(state.error),
            );
          }
          return const Center(
            child: Text('BLOC ISHLMADI'),
          );
        },
      ),
    );
  }
}
