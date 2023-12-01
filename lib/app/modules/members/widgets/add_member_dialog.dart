import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'form_field.dart';

class AddMemberDialog extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final titleController = TextEditingController();
  final phoneController = TextEditingController();

  AddMemberDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Member"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CAFormField(
                    label: 'Name',
                    controller: nameController,
                  ),
                  const SizedBox(height: 16),
                  CAFormField(
                    label: 'Email',
                    controller: emailController,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return null;
                      }
                      if (GetUtils.isEmail(value)) {
                        return 'We need valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CAFormField(
                    label: 'Phone',
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  CAFormField(
                    label: 'Title',
                    controller: titleController,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        color: Theme.of(context).colorScheme.primary,
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
