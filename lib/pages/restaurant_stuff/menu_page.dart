import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class AddMenuPage extends StatefulWidget {
  const AddMenuPage({super.key});

  @override
  State<AddMenuPage> createState() => _AddMenuPageState();

}

class _AddMenuPageState extends State<AddMenuPage> {
  TextEditingController menuIDController = TextEditingController();
  TextEditingController restIDController = TextEditingController();
  TextEditingController foodIDListController = TextEditingController();
  TextEditingController menuTypeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Menu'),
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
            controller: menuIDController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: 'Menu ID'),
          ),
          TextField(
            controller: menuTypeController,
            decoration: InputDecoration(hintText: 'Menu Type'),
          ),
          TextField(
            controller: foodIDListController,
            decoration: InputDecoration(hintText: 'Food ID List'),
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
    final restID = int.parse(restIDController.text);
    final menuID = int.parse(menuIDController.text);
    final foodIDList = foodIDListController.text;
    final menuType = menuTypeController.text;

    final body = {
      "menuID": menuID,
      "restID": restID,
      "foodIDlist": foodIDList,
      "menuType": menuType
    };
    //sumit data to the server
    final url = 'http://10.0.2.2:5000/api/Menu';
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
