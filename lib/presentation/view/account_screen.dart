import 'package:book_shop/data/datasource/local/local_database.dart';
import 'package:book_shop/presentation/registrs/sign_in_screen.dart';
import 'package:book_shop/presentation/registrs/sign_up_screen.dart';
import 'package:book_shop/presentation/widgets/profile_info_widget.dart';
import 'package:book_shop/utils/constanst/All_text.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FutureBuilder(
          future: LocalDatabase().readAllData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text(
                  AllText.didNotReg,
                  style: customStyle,
                ),
              );
            } else if (snapshot.hasData) {
              return Stack(
                // alignment: Alignment.topCenter,
                fit: StackFit.loose,
                children: [
                  Container(
                    color: Colors.red,
                    width: size.width,
                    height: size.height,
                  ),
                  Positioned(
                    top: size.height * 0.25,
                    child: Container(
                      color: Colors.white,
                      width: size.width,
                      height: size.height * 0.75,
                    ),
                  ),
                  Positioned(
                    right: 28,
                    top: 26,
                    child: PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: AllText.logOut,
                          child: Text(
                            AllText.logOut,
                            style: customStyle,
                          ),
                        ),
                        PopupMenuItem(
                          value: AllText.logIn,
                          child: Text(
                            AllText.logIn,
                            style: customStyle,
                          ),
                        )
                      ],
                      iconSize: 26,
                      iconColor: Colors.white,
                      onSelected: (String str) async {
                        if (str == AllText.logOut) {
                          await LocalDatabase().clearAllData();
                          if (context.mounted) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const SignUpScreen()),
                                (route) => false);
                          }
                        } else if (str == AllText.logIn) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const SignInScreen()),
                              (route) => false);
                        }
                      },
                    ),
                  ),
                  Positioned(
                    top: (size.height * 0.25) - 60,
                    left: (size.width - 120) / 2,
                    child: const CircleAvatar(
                      backgroundColor: Colors.black38,
                      radius: 60.0,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/person.png'),
                        radius: 50.0,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    width: size.width,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return ProfileInfoWidget(
                            text: snapshot.data[0][signUserList[index]],
                            text2: signUserList[index],
                          );
                        }),
                  ),
                ],
              );
            }
            return Center(
              child: Text(
                AllText.wentWrong,
                style: customStyle,
              ),
            );
          }),
    );
  }
}
