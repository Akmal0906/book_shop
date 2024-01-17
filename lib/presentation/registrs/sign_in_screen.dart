import 'package:book_shop/presentation/registrs/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/textfield_models/textfield_model.dart';
import '../../utils/constanst/All_text.dart';
import '../../utils/resource/toast_message.dart';
import '../blocs/register/register_bloc.dart';
import '../view/combain_screen.dart';
import '../widgets/buttun_widget.dart';
import '../widgets/mytextfield_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController userNameController;
  final TextEditingController passwordController = TextEditingController();
  List list = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    list = [
      TextFieldModel(
          controller: userNameController,
          isNeed: false,
          hintText: AllText.userName,
          obscureText: false),
      TextFieldModel(
          controller: passwordController,
          isNeed: true,
          hintText: AllText.password,
          obscureText: true),
    ];
  }

  void directFunc() {
    context.read<RegisterBloc>().add(RegisterSignInEvent(
        name: userNameController.text.trim(),
        password: passwordController.text.trim()));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          centerTitle: true,
          title: const Text(AllText.apbar),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 18,
                ),
                Text(
                  AllText.enterPassUser,
                  style: customStyle,
                ),
                const SizedBox(
                  height: 12,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MyTextFieldWidget(model: list[index]);
                    }),
              ],
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      ButtonWidget(onTap: directFunc, text: AllText.signIn),
                      BlocConsumer<RegisterBloc, RegisterState>(
                        builder: (BuildContext context, state) {
                          if (state is RegisterLoadingState) {
                            return const Center(
                              child: CupertinoActivityIndicator(
                                radius: 18,
                                color: Colors.black54,
                                animating: true,
                              ),
                            );
                          } else if (state is RegisterFailureState) {
                            toastMessage(state.message);
                          } else if (state is RegisterInitialState) {
                            return const SizedBox.shrink();
                          } else if (state is RegisterSuccessState) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CombainScreen()),
                                  (Route<dynamic> route) => false);
                            });
                            toastMessage(state.success);
                          }
                          return const SizedBox.shrink();
                        },
                        listener: (BuildContext context, Object? state) {},
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        AllText.haveNotAccount,
                        style: customStyle,
                      ),
                      TextButton(
                          autofocus: true,
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                              elevation: MaterialStateProperty.all<double>(4),
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.all(12)),
                              fixedSize: MaterialStateProperty.all<Size>(
                                  const Size(120, 42)),
                              surfaceTintColor:
                                  MaterialStateProperty.all<Color>(
                                      Colors.yellow),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: BorderSide(
                                          color: Colors.grey.shade400,
                                          width: 1))),
                              alignment: Alignment.center,
                              shadowColor:
                                  MaterialStateProperty.all<Color>(Colors.deepPurpleAccent)),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                          },
                          child: Text(
                            AllText.signUp,
                            style: customStyle.copyWith(color: Colors.white),
                          ))
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 32,),
          ],
        ),
      ),
    );
  }
}
