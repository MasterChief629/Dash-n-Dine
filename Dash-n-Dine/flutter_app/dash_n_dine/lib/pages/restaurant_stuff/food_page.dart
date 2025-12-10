import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class AddFoodPage extends StatefulWidget {
  const AddFoodPage({super.key});

  @override
  State<AddFoodPage> createState() => _AddFoodPageState();

}

class _AddFoodPageState extends State<AddFoodPage> {
  TextEditingController foodIDController = TextEditingController();
  TextEditingController menuIDController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imagePathController = TextEditingController();
  TextEditingController customizationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Food'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: foodIDController,
            decoration: InputDecoration(hintText: 'Food ID'),
          ),
          TextField(
            controller: menuIDController,
            decoration: InputDecoration(hintText: 'Menu ID'),
          ),
          TextField(
            controller: nameController,
            decoration: InputDecoration(hintText: 'Name'),
          ),
          TextField(
            controller: priceController,
            decoration: InputDecoration(hintText: 'Price'),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(hintText: 'Description'),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          TextField(
            controller: imagePathController,
            decoration: InputDecoration(hintText: 'Image Path'),
          ),
          TextField(
            controller: customizationController,
            decoration: InputDecoration(hintText: 'Customization'),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: submitData, child: Text('Submit')),
        ]
      ),
    );
  }


  Future<void> submitData() async {
    //get data from form
    final foodID = int.parse(foodIDController.text);
    final menuID = int.parse(menuIDController.text);
    final name = nameController.text;
    final price = double.parse(priceController.text);
    final description = descriptionController.text;
    final imagePath = imagePathController.text;
    final customization = customizationController.text;

    final body = {
      "foodID": foodID,
      "menuID": menuID,
      "foodName": name,
      "price": price,
      "foodDescription": description,
      "imagePath": imagePath,
      "customization": customization
    };
    //sumit data to the server
    final url = 'http://10.0.2.2:5000/api/Food';
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'}
      );
    //show success or fail message based on status
    if (response.statusCode == 201) {
    showSuccessMessage('Creation Success');
    } else{
      showErrorMessage('Creation Failed');
      }
  }

  void showSuccessMessage(String message){
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.black)
        ),
        backgroundColor: Colors.green,
      );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorMessage(String message){
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.red,
        );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}