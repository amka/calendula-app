import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                          fontSize: 32,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'We need email address';
                        }
                        if (!GetUtils.isEmail(value!)) {
                          return 'We need valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: controller.passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    Text('By signing in you accept Terms and Privacy Policy'),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                          onPressed: () async {
                            if (controller.formKey.currentState!.validate()) {
                              await controller.signIn();
                            }
                          },
                          child: const Text(
                            'Sign In',
                          )),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
