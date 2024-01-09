import 'package:book_shop/presentation/blocs/categories_blocs/category_bloc.dart';
import 'package:book_shop/presentation/blocs/get_books_bloc/book_bloc.dart';
import 'package:book_shop/presentation/blocs/register/register_bloc.dart';
import 'package:book_shop/simple_bloc_observer_screen.dart';
import 'package:book_shop/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryBloc>(
            create: (context) =>
                CategoryBloc()..add(const TakeCategoryItemEvent(0))),
        BlocProvider(create: (context) => BookBloc()),
        BlocProvider(
            create: (context) => RegisterBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
