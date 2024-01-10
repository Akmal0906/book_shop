import 'package:book_shop/domain/models/textfield_models/sign_user_model.dart';
import 'package:book_shop/domain/models/textfield_models/textfield_model.dart';
import 'package:book_shop/presentation/registrs/sign_in_screen.dart';
import 'package:book_shop/presentation/view/combain_screen.dart';
import 'package:book_shop/presentation/widgets/buttun_widget.dart';
import 'package:book_shop/presentation/widgets/mytextfield_widget.dart';
import 'package:book_shop/presentation/widgets/signIn_button_widget.dart';
import 'package:book_shop/utils/constanst/All_text.dart';
import 'package:book_shop/utils/resource/toast_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/register/register_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController userNameController;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController password1Controller = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();
  List list = [];

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
          controller: emailController,
          isNeed: false,
          hintText: AllText.email,
          obscureText: false),
      TextFieldModel(
          controller: password1Controller,
          isNeed: true,
          hintText: AllText.password,
          obscureText: true),
      TextFieldModel(
          controller: password2Controller,
          isNeed: true,
          hintText: AllText.repPassword,
          obscureText: true),
    ];

  }

  void directFunc() {
    final nomericRex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (password1Controller.text.trim() == password2Controller.text.trim() &&
        password1Controller.text.length > 8 &&
        nomericRex.hasMatch(password1Controller.text.trim()) == true) {

      SignUserModel model = SignUserModel(
          username: userNameController.text,
          email: emailController.text,
          password1: password1Controller.text.trim(),
          password2: password2Controller.text.trim());
      context.read<RegisterBloc>().add(RegisterSubmitted(model: model));
    } else {
      toastMessage(AllText.wentWrong);

    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          centerTitle: true,
          title: const Text(AllText.apbar),
        ),
        body: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    AllText.createAccount,
                    style: customStyle,
                  ),
                   SizedBox(
                    height: MediaQuery.of(context).size.height*0.05,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MyTextFieldWidget(model: list[index]);
                      }),
                  const SizedBox(
                    height: 18,
                  ),

                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      ButtonWidget(onTap: directFunc, text: AllText.signUp),
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

                          } else if(state is RegisterInitialState){
                            return const SizedBox.shrink();
                          }else if (state is RegisterSuccessState) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                              const CombainScreen()), (Route<dynamic> route) => false);
                            });

                            toastMessage(AllText.signSuccess);
                          }
                          return const SizedBox.shrink();
                        },
                        listener: (BuildContext context, Object? state) {},
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width / 4, right: size.width / 4, top: 12),
                    child: Row(
                      children: [
                        const Expanded(
                            child: Divider(
                              thickness: 1,
                              indent: 2,
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            AllText.or,
                            style: customStyle,
                          ),
                        ),
                        const Expanded(
                            child: Divider(
                              thickness: 1,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(height: 32,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        AllText.haveAccount,
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
                                builder: (context) => const SignInScreen()));
                          },
                          child: Text(
                            AllText.signIn,
                            style: customStyle.copyWith(color: Colors.white),
                          ))
                    ],
                  ),
                  const SizedBox(height: 12,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
