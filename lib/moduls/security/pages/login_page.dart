import 'package:app_prueba/moduls/security/models/login_page_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginPageController controller = LoginPageController();

  String? validateEmail(String? value) {
    if(value == null || value.isEmpty) {
      return 'El campo correo es requerido';
    }

    if(value.length < 6) {
      return 'El correo debe tener al menos 6 caracteres';
    }

    if(value.length > 50) {
      return 'El correo debe tener máximo 50 caracteres';
    }

    if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'El correo debe ser válido';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if(value == null || value.isEmpty) {
      return 'El campo contraseña es requerido';
    }

    if(value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }

    if(value.length > 12) {
      return 'La contraseña debe tener máximo 12 caracteres';
    }

    if(!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'La contraseña debe contener al menos una letra mayúscula';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.emailController,
                decoration: const InputDecoration(
                  label: Text('Correo'),
                  border: OutlineInputBorder(),
                  hintText: 'ejemplo@correo.com',
                  prefix: Icon(Icons.email),
                ),
                validator: validateEmail,
              ),
              SizedBox(height: 15.0,),
              TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                  label: Text('Contraseña'),
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        controller.isObscure = !controller.isObscure;
                      });
                    },
                    icon: Icon(
                      controller.isObscure ? Icons.visibility : Icons.visibility_off
                    ),
                  )
                ),
                validator: validatePassword,
                obscureText: controller.isObscure,
              ),
              SizedBox(height: 15.0,),
              SizedBox(
                height: 48.0,
                child: controller.loading ? const CircularProgressIndicator() : ElevatedButton(
                  onPressed: controller.loading ? null : login,
                  child: Text('Iniciar'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void login() async{
    final isValid = controller.formKey.currentState?.validate();
    
    if(!isValid!) {
      return;
    }

    setState(() {
      controller.loading = true;
    });

    await Future.delayed(const Duration(seconds: 2), () {});
    
    
    setState(() {
      controller.loading = false;
    });

    print('Is valid: $isValid');
  }
}