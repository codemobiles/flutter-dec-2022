import 'package:flutter/material.dart';

final formState = GlobalKey<FormState>();

class ProductForm extends StatelessWidget {
  const ProductForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Form(
        key: formState,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              initialValue: "ProductA",
              decoration: InputDecoration(labelText: "Name"),
              onSaved: (value) {
                print("Name: " + (value ?? ""));
              },
            ),
            TextFormField(
              initialValue: "100",
              decoration: InputDecoration(labelText: "Price"),
              onSaved: (value) {
                print("Price: " + (value ?? ""));
              },
            ),
            TextFormField(
              initialValue: "1,000",
              decoration: InputDecoration(labelText: "Name"),
              onSaved: (value) {
                print("Stock: " + (value ?? ""));
              },
            ),
            ElevatedButton(onPressed: (){}, child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
