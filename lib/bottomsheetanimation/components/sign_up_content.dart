import 'package:flutter/material.dart';

class SignUpContent extends StatelessWidget {
  const SignUpContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create an Account",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 32,
            ),
            TextFieldWidget(label: "Email Address", iconData: Icons.email),
            const SizedBox(height: 16,),
            TextFieldWidget(label: "Password", iconData: Icons.lock),
            const SizedBox(height: 200),
            Text(
              "Already have an account? Sign in.",
              style: TextStyle(fontSize: 16, color: Colors.blueGrey.shade300),
            )
          ],
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final String label;
  final IconData iconData;
  final bool isHidden;
  TextFieldWidget({
    required this.label,
    required this.iconData,
    this.isHidden = false,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16),
    child: Flexible(
      child: TextField(
        cursorColor: Colors.pink,
        obscureText: isHidden,
        autocorrect: !isHidden,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.grey.shade400, fontSize: 18
          ),
          suffixIcon: Icon(
            iconData,
            color: Colors.grey.shade400,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.pink.shade400,
            ),
          ),
        ),
      ),
    ),);
  }
}
