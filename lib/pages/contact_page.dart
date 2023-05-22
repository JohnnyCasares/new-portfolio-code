// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portfolio/input/text_field.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/services/firebase.dart';
import 'package:email_validator/email_validator.dart';

class ContactPage extends StatefulWidget {
  ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController message = TextEditingController();
  TextEditingController subject = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    subject.dispose();
    message.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Contact Form",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Row(
                children: [
                  Flexible(
                    child: MyTextField(
                      hint: "First Name",
                      controller: firstName,
                      validator: (name) =>
                          name!.isEmpty ? "Please enter your first name" : null,
                    ),
                  ),
                  Flexible(
                      child: MyTextField(
                    hint: "Last Name",
                    controller: lastName,
                    validator: (name) =>
                        name!.isEmpty ? "Please enter your last name" : null,
                  ))
                ],
              ),
              MyTextField(
                hint: "Email",
                controller: email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!EmailValidator.validate(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              MyTextField(
                hint: "Subject",
                controller: subject,
                validator: (subject) =>
                    subject!.isEmpty ? "Please enter a subject" : null,
              ),
              MyTextField(
                hint: "Body of your message",
                maxLines: 10,
                controller: message,
                validator: (body) =>
                    body!.isEmpty ? "Please type your message" : null,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (validate()) {
                      sendEmail(firstName.text, lastName.text, email.text,
                          message.text, subject.text);
                    }
                  },
                  child: const Text("Send"))
            ],
          ),
        ),
      ),
    );
  }

  bool validate() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  final MyFireBase emailJS = MyFireBase("emailJS");
  void sendEmail(String firstName, String lastName, String email,
      String message, String subject) async {
    List<String> apiTokens = await emailJS.emailJSgetApiKey();
    String serviceID, templateID, userID;
    serviceID = apiTokens[1];
    templateID = apiTokens[2];
    userID = apiTokens[3];
    print(apiTokens);
    final response = await http.post(
      Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'service_id': serviceID,
        'template_id': templateID,
        'user_id': userID,
        'template_params': {
          'from_name': '$firstName $lastName',
          'subject': subject,
          'message': message,
          'from_email': email
        }
      }),
    );
    if (response.statusCode == 200) {
      print('Email sent successfully.');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Message sent successfully. Thank you for reaching out"),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Message could not be sent. Try again"),
        backgroundColor: Colors.red,
      ));

      print('Failed to send email. Error: ${response.body}');
    }
  }
}
