import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AddRestaurantPage extends StatefulWidget {
  const AddRestaurantPage({super.key});

  @override
  State<AddRestaurantPage> createState() => _AddRestaurantPageState();

}

class _AddRestaurantPageState extends State<AddRestaurantPage> {
  TextEditingController restIDController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController hoursController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Restaurant'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: restIDController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: 'Restaurant ID'),
          ),
          TextField(
            controller: nameController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: 'Name'),
          ),
          TextField(
            controller: hoursController,
            decoration: InputDecoration(hintText: 'Hours'),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: submitData, child: Text('Submit')),
        ]
      ),
    );
  }


  Future<void> submitData() async {
    //get data from form
    final restID = int.parse(restIDController.text);
    final name = nameController.text;
    final hours = hoursController.text;

    final body = {
      "restID": restID,
      "restName": name,
      "restHours": hours
    };
    //sumit data to the server
    final url = 'http://10.0.2.2:5000/api/Restaurant';
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'}
      );
    
    //show success or fail message based on status
    if (response.statusCode == 201) {
      restIDController.text = '';
      nameController.text = '';
      hoursController.text = '';
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