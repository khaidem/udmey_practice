//** StateFull Widget use because we want to manage the data in widget user might
//** Cancel, adding, do anything, so the general app is not effected by the user input
//** until it resubmit it .
//* so want to manage the user input and validate it and  so locally in this  widget
//** and hence so stateful widget is the right solution. Instead of provider package
//** or globaly confrigure */ */ */ */ */

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:practice_app/ShoppingApp/Logic/product.model.dart';
import 'package:practice_app/ShoppingApp/Logic/product_provider.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key}) : super(key: key);
  static const routeName = '/edit-product';
  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _focusPrice = FocusNode();
  final _description = FocusNode();

  //** for adding initialValue add to TextEditingController */
  final _imageUrlController = TextEditingController();
  final _imageFocus = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editProduct =
      ProductModel(id: '', description: '', imageUrl: '', price: 0, title: '');

  //** using Focus node it might lead to memory leak so us use dispose method
  //* state object to destroy*/
  @override
  void dispose() {
    _description.dispose();
    _focusPrice.dispose();
    _imageFocus.dispose();
    _imageFocus.removeListener(_updateImageUrl);

    super.dispose();
  }

  @override
  void initState() {
    _imageFocus.addListener(_updateImageUrl);
    super.initState();
  }
  //**  we need to extract it in editProductScreen form userProductScreen of id
  //** perfect place to extract is in initalState but ModelRoute will not work in
  //** initailState... But if you had data form other source instead form our routing
  //** action you could definitly use  in initailState*/

//** disChange dependency also run before build */

//** These are setUp for newProduct and we override them here */

  var initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': '',
  };

  ///* This will run first   when we open this page and also we added new product //
  /// ** So retrive argument form user_product.screen.dart
  var _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      //** A route that blocks interaction with previous routes. -- ModalRoute
      //**ModalRoute to retrieve arguments form user_product.screen.dart */ */
      final productId = ModalRoute.of(context)!.settings.arguments;
      if (productId != null) {
        _editProduct = Provider.of<ProductsProvider>(context, listen: false)
            .findId(productId.toString());
        initValues = {
          'title': _editProduct.title,
          'description': _editProduct.description,
          'price': _editProduct.price.toString(),
          // 'imageUrl': _editProduct.imageUrl,
          'imageUrl': '',
        };
        _imageUrlController.text = _editProduct.imageUrl;
      }
      log(productId.toString());
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _updateImageUrl() {
    if (!_imageFocus.hasFocus) {
      if ((!_imageUrlController.text.startsWith('http') &&
              !_imageUrlController.text.startsWith('https')) ||
          (!_imageUrlController.text.endsWith('.png') &&
              !_imageUrlController.text.endsWith('.jpg') &&
              !_imageUrlController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    //** if is not valid return */
    if (!isValid) {
      return;
    }
    //** is valid use save */
    _form.currentState!.save();
    // context.read<ProductsProvider>().addNewProduct(_editProduct);
    Provider.of<ProductsProvider>(context, listen: false)
        .addNewProduct(_editProduct);

    //*** Finding out whether we are editing or not. Edited Product Id is only set if we load
    //** a product because we received an Id as an argument because if we receive an Id as an argument
    //** we kick off this whole logic here where we find a product by Id and then our edited product then
    //** and this Obviously has an Id we are finding By ID, Instead if you are adding a new Product
    //** edited product is set equal to a product where we set the Id to null , so where we don't have an Id and
    //** therefore this is great check. if we have an Id , so if this is not equal to null , then i know I'm editing.
    //** If we have an Id and not equal to null , then this product existed before otherwise we are adding
    //** so in the else case , we want to call add product, in the edit case we want to update and existing product */ */ */ */ */ */ */ */
    // if (_editProduct.id != null) {
    //   // Provider.of<ProductsProvider>(context, listen: false)
    //   //     .updateProduct(_editProduct.id!, _editProduct);
    //   context
    //       .read<ProductsProvider>()
    //       .updateProduct(_editProduct.id!, _editProduct);
    // } else {
    //   // Provider.of<ProductsProvider>(context, listen: false)
    //   //     .addNewProduct(_editProduct);
    //   context.read<ProductsProvider>().addNewProduct(_editProduct);
    // }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        actions: [
          IconButton(
              onPressed: () {
                _saveForm();
                log('message form Save');
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _form,
//**For short lists/ portrait-only apps, where only minimal scrolling might be needed, a ListView should be fine, since items won't scroll that far out of
//**view (ListView has a certain threshold until which it will keep items in memory).
//**But for longer lists or apps that should work in landscape mode as well - or maybe just to be safe - you might want to use a Column (combined with SingleChildScrollView) instead. Since
//** SingleChildScrollView doesn't clear widgets that scroll out of view, you are not in danger of losing user input in that case. */ */
            child: ListView(
              children: [
                TextFormField(
                  initialValue: initValues['title'],
                  decoration: const InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_focusPrice);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please Enter ';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _editProduct = ProductModel(
                      //** we set Id as null and say nothing about the Favorite Status which
                      //** mean that we all use the default favorite status of false to recreate
                      //** these products. Therefore , my ID get lost and the previous favorite
                      //** status get lost . Solution is to set this equal to  _editProduct.id and
                      //** also set isFavorite equal to editedProduct.isFavorite.
                      //** so all the places where we crate a new Product we add this*/ */ */ */ */
                      id: _editProduct.id,
                      isFavorite: _editProduct.isFavorite,
                      title: value!,
                      description: _editProduct.description,
                      imageUrl: _editProduct.imageUrl,
                      price: _editProduct.price,
                    );
                  },
                ),
                TextFormField(
                  initialValue: initValues['price'],
                  decoration: const InputDecoration(labelText: 'price'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _focusPrice,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_description);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter price";
                    }
                    if (double.tryParse(value) == null) {
                      return 'Enter valid number';
                    }
                    if (double.parse(value) <= 0) {
                      return 'Number should be Greater than zero';
                    }
                    //** ALl the above condition satisfied  */
                    return null;
                  },
                  onSaved: (value) {
                    _editProduct = ProductModel(
                      id: _editProduct.id,
                      isFavorite: _editProduct.isFavorite,
                      title: _editProduct.title,
                      description: _editProduct.description,
                      imageUrl: _editProduct.imageUrl,
                      price: double.parse(value!),
                    );
                  },
                ),
                TextFormField(
                  initialValue: initValues['description'],
                  decoration: const InputDecoration(labelText: 'Description'),
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  focusNode: _description,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter description';
                    }
                    if (value.length < 10) {
                      return 'Enter at least 10 character long';
                    }

                    return null;
                  },
                  onSaved: (value) {
                    _editProduct = ProductModel(
                        id: _editProduct.id,
                        isFavorite: _editProduct.isFavorite,
                        title: _editProduct.title,
                        description: value!,
                        imageUrl: _editProduct.imageUrl,
                        price: _editProduct.price);
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.only(top: 8, right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: _imageUrlController.text.isEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [Text('Image Empty')])
                          : FittedBox(
                              child: Image.network(
                                _imageUrlController.text,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    Expanded(
                        child: TextFormField(
                      //** You can't use both initialValue and controller at the same time.
                      //**So, it's better to use controller as you can set default text in its constructor. */
                      // initialValue: initValues['imageUrl'],

                      decoration: const InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      focusNode: _imageFocus,
                      onEditingComplete: () {
                        setState(() {});
                      },
                      onFieldSubmitted: (_) {
                        _saveForm();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an image URL.';
                        }
                        if (!value.startsWith('http') &&
                            !value.startsWith('https')) {
                          return 'Please enter a valid URL.';
                        }
                        if (!value.endsWith('.png') &&
                            !value.endsWith('.jpg') &&
                            !value.endsWith('.jpeg')) {
                          return 'Please enter a valid image URL.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editProduct = ProductModel(
                          id: _editProduct.id,
                          isFavorite: _editProduct.isFavorite,
                          title: _editProduct.title,
                          description: _editProduct.description,
                          imageUrl: value!,
                          price: _editProduct.price,
                        );
                      },
                    )),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
