// ignore_for_file: file_names, prefer_final_fields, non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_app/resources/colors.dart';
import 'package:mvvm_app/resources/components/rounded_button.dart';
import 'package:mvvm_app/utilities/routes/routes_name.dart';
import 'package:mvvm_app/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../utilities/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obsecure = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwardController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwardFocusNode = FocusNode();
  FocusNode ButtonFocusNode = FocusNode();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwardController.dispose();
    emailFocusNode.dispose();
    passwardFocusNode.dispose();
    ButtonFocusNode.dispose();
    _obsecure.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Auth_View_model = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.defaultColor,
          title: const Text('Login Screen'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    focusNode: emailFocusNode,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: 25),
                      prefixIcon: Icon(Icons.alternate_email),
                    ),
                    onFieldSubmitted: (value) {
                      Uitils.fieldFocuschange(
                          context, emailFocusNode, passwardFocusNode);
                    },
                  ),
                  SizedBox(
                    height: height * 0.005,
                  ),
                  ValueListenableBuilder(
                    valueListenable: _obsecure,
                    builder: (context, value, child) {
                      return TextFormField(
                        obscureText: _obsecure.value,
                        obscuringCharacter: '*',
                        controller: _passwardController,
                        focusNode: passwardFocusNode,
                        decoration: InputDecoration(
                          hintText: 'Passward',
                          labelText: 'Passward',
                          labelStyle: const TextStyle(fontSize: 25),
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: InkWell(
                              onTap: () {
                                _obsecure.value = !_obsecure.value;
                              },
                              child: Icon(_obsecure.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility)),
                        ),
                        onFieldSubmitted: (value) {
                          Uitils.fieldFocuschange(
                              context, passwardFocusNode, ButtonFocusNode);
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: height * .005,
                  ),
                  RoundButton(
                    loading: Auth_View_model.loading,
                    Focusnode: ButtonFocusNode,
                    title: 'Login',
                    onPress: () {
                      if (!_emailController.text.contains('.com') &&
                          !_emailController.text.contains('@')) {
                        Uitils.flashBarErrorMessage(
                            'please enter valid Email', context);
                      } else if (_emailController.text.isEmpty) {
                        Uitils.flashBarErrorMessage(
                            'please Enter Email', context);
                      } else if (_passwardController.text.isEmpty) {
                        Uitils.flashBarErrorMessage(
                            'please Enter passward', context);
                      } else if (_passwardController.text.length < 6) {
                        Uitils.flashBarErrorMessage(
                            'please Enter 6 digit passward', context);
                      } else {
                        // Map data = {
                        //   'email': _emailController.text.toString(),
                        //   'password': _passwardController.text.toString(),
                        // };
                        Map data = {
                          'email': 'eve.holt@reqres.in',
                          'password': 'fsdgdfhdf',
                        };
                        Auth_View_model.LoginApi(data, context);
                        if (kDebugMode) {
                          print('Api hit');
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.signUp);
                      },
                      child: const Text(
                        'Don’t have an account? Sign Up',
                        style: TextStyle(fontSize: 20),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
