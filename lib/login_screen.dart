import 'package:flutter/material.dart';
import 'package:remed_sem5/firebase_auth_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isSecure = true;
  AuthHelper authHelper = AuthHelper();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                  "https://freesvg.org/img/Cloud-Silhouette.png",
                  width: 100,
                ),
                Text("Aplikasi Remed"),
                SizedBox(height: 50),
                Form(
                  key: formKey,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Masuk",
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              return null;
                            }
                            return "Tidak boleh kosong...";
                          },
                          controller: email,
                          decoration: InputDecoration(
                            labelText: "Email",
                          ),
                          onChanged: (value) {
                            setState(() {
                              email.text = value;
                              email.selection = TextSelection.fromPosition(
                                  TextPosition(offset: email.text.length));
                            });
                          },
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              return null;
                            }
                            return "Tidak boleh kosong...";
                          },
                          controller: password,
                          obscureText: isSecure,
                          decoration: InputDecoration(
                            labelText: "Password",
                            suffixIcon: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                setState(() {
                                  isSecure = !isSecure;
                                });
                              },
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              password.text = value;
                              password.selection = TextSelection.fromPosition(
                                  TextPosition(offset: password.text.length));
                            });
                          },
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                authHelper.loginEmail(context,
                                    email: email.text, password: password.text);
                              }
                            },
                            child: Text("Masuk"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
