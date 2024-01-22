import 'package:book_shop/utils/constanst/All_text.dart';
import 'package:flutter/material.dart';
import '../../data/network/api.dart';
import 'author_widget.dart';

class AuthorsScreen extends StatelessWidget {
  const AuthorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: FetchData().getAuthors(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AuthorWidget(
                      name: snapshot.data[index].name,
                      description: snapshot.data[index].description,
                    );
                  },
                );
              } else {
                return Center(
                  child: Text(
                    'Data did not found',
                    style: customStyle.copyWith(fontSize: 18),
                  ),
                );
              }
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
