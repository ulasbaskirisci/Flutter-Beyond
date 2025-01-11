import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FormBuilderExamplePage extends StatefulWidget {
  const FormBuilderExamplePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormBuilderExamplePageState createState() => _FormBuilderExamplePageState();
}

class _FormBuilderExamplePageState extends State<FormBuilderExamplePage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enhanced Form Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            children: [
              // İsim ve Soyisim
              FormBuilderTextField(
                name: 'full_name',
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Enter your full name (e.g., ...)',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  (value) {
                    if (value != null && value.trim().split(' ').length < 2) {
                      return 'Please provide both first and last name.';
                    }
                    return null;
                  },
                ]),
              ),
              const SizedBox(height: 20),

              // E-posta
              FormBuilderTextField(
                name: 'email',
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email (e.g., example@gmail.com)',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
              const SizedBox(height: 20),

              // Telefon Numarası
              FormBuilderTextField(
                name: 'phone',
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  hintText: 'Enter your phone number (e.g., 5551234567)',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.match(
                    RegExp(r'^\d{10}$'),
                    errorText: 'Phone number must be 10 digits.',
                  ),
                ]),
                keyboardType: TextInputType.phone,
              ),


              
            ],
          ),
        ),
      ),
    );
  }
}
