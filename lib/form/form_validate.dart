import 'package:flutter/material.dart';

class FormValidate extends StatefulWidget {
  const FormValidate({Key? key}) : super(key: key);

  @override
  State<FormValidate> createState() => _FormValidateState();
}

class _FormValidateState extends State<FormValidate> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 88.0, horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter name";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: "Enter Your name",
                    filled: true,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none),
              ),
              SizedBox(height: 20,),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter name";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: "Enter Your name",
                    filled: true,
                    border: OutlineInputBorder(),
                    ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                onChanged: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter value is $value")));
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter name";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: "Enter LOL Your name",
                    filled: true,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Processing Data")));
                    }
                  },
                  child: Text("Submit"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
