import 'dart:io';

import 'package:demo1/src/models/product.dart';
import 'package:demo1/src/pages/management/widgets/product_form.dart';
import 'package:flutter/material.dart';

class ManagementPage extends StatefulWidget {
  const ManagementPage({Key? key}) : super(key: key);

  @override
  State<ManagementPage> createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  final _form = GlobalKey<FormState>();
  var _product = Product(name: "productX", price: 100, stock: 20);
  var _editMode = false;
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    final Object? arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments != null && arguments is Product) {
      print(arguments.name);
    }

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          child: Column(
                            children: [
                              ListTile(leading: Icon(Icons.camera), title: Text("xxxx")),
                              ListTile(leading: Icon(Icons.picture_as_pdf), title: Text("yyyy")),
                            ],
                          ),
                          height: 150,
                        );
                      });
                },
                icon: Icon(Icons.add))
          ],
          title: Text('ManagementPage'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ProductForm(
            _product,
            callBackSetImage: _handleCallBackSetImage,
            formKey: _form,
            deleteProduct: _handleDeleteProduct,
          ),
        ));
  }

  _handleCallBackSetImage() {}

  _handleDeleteProduct() {}
}
