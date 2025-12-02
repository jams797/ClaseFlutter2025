import 'package:flutter/widgets.dart';

class LoginPageController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  bool isObscure = true;

  bool loading = false;
}