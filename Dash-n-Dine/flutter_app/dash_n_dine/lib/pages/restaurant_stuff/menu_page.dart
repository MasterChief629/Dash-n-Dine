import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class AddMenuPage extends StatefulWidget {
  final Map? editing;
  const AddMenuPage({
    super.key,
    this.editing,
    });

  @override
  State<AddMenuPage> createState() => _AddMenuPageState();

}

class _AddMenuPageState extends State<AddMenuPage> {
  TextEditingController menuIDController = TextEditingController();
  TextEditingController restIDController = TextEditingController();
  TextEditingController foodIDListController = TextEditingController();
  TextEditingController menuTypeController = TextEditingController();
  bool isEdit = false;

  @override
  void initState () {
    super.initState();
    final editing = widget.editing;
    if(editing != null) {
      isEdit = true;
      final menuID = editing['menuID'];
      final restID = editing['restID'];
      final foodIDList = editing['foodIDlist'];
      final menuType = editing['menuType'];

      restIDController.text = restID.toString();
      menuIDController.text = menuID.toString();
      foodIDListController.text = foodIDList;
      menuTypeController.text = menuType;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEdit ? 'Edit Menu' : 'Add Menu',
          ),
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
          ElevatedButton(onPressed: isEdit ? updateData :submitData, child: Text(
            isEdit ? 'Update' : 'Submit',
            )
          ),
        ]
      ),
    );
  }

  Future<void> updateData() async {
    //get data from form
    final editing = widget.editing;
    if (editing == null) {
      print('You cannot call updated  without editing data');
      return;
    }

    final id = editing['menuID'];
    final restID = int.parse(restIDController.text);
    final foodIDList = foodIDListController.text;
    final menuType = menuTypeController.text;

    final body = {
      "restID": restID,
      "foodIDlist": foodIDList,
      "menuType": menuType,
    };

    final url = 'http://10.0.2.2:5000/api/Menu/menuID/$id';
    final uri = Uri.parse(url);
    final response = await http.put(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'}
      );

    if (response.statusCode == 200) {
      showSuccessMessage('Update Success');
    } else{
      showErrorMessage('Update Failed');
    }

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
      "menuType": menuType,
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
