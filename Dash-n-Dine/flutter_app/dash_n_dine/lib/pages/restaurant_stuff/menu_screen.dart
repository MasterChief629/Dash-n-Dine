import 'dart:convert';
import 'package:dash_n_dine/pages/restaurant_stuff/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MenuListScreen extends StatefulWidget {
  @override
  _MenuListScreenState createState() => _MenuListScreenState();
}

class _MenuListScreenState extends State<MenuListScreen> {
  bool isLoading = true;
  List menus = [];

  @override
  void initState() {
    super.initState();
    getMenus();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Page')
      ),
      body: Visibility(
        visible: isLoading,
        // ignore: sort_child_properties_last
        child: Center(child: CircularProgressIndicator()),
        replacement: RefreshIndicator(
        onRefresh: getMenus,
        child: ListView.builder(
        itemCount: menus.length,
        itemBuilder: (context, index) {
          final menu = menus[index] as Map;
          final id = menu['menuID'] as int;
          return ListTile(
            title: Text(menu['restName']),
            subtitle: Text(menu['menuType']),
            trailing: PopupMenuButton(
              onSelected: (value) {
                if(value == 'edit') {
                  navigateToEditPage(menu);
                }else if (value == 'delete') {
                  deleteByID(id);
                }
              },
              itemBuilder: (context){
                return [
                  PopupMenuItem(
                    child: Text('Edit'),
                    value: 'edit',
                    ),
                  PopupMenuItem(
                    child: Text('Delete'),
                    value: 'delete',
                    )
                ];
              },
              ),
        );
      }
      ),
      ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToAddPage,
        label: Text('Add Menu'),
      ),

    );
  }

  Future<void> deleteByID(int id) async {
    final url = 'http://10.0.2.2:5000/api/Menu/menuID/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    if (response.statusCode == 204) {
      final filtered = menus.where((element) => element['menuID'] != id).toList();
      setState(() {
        menus = filtered;
      });
    } else {
      showErrorMessage('Unable to Delete');
    }
  }

  void navigateToEditPage(Map menu) {
    final route = MaterialPageRoute(builder: (context) => AddMenuPage(editing: menu),
    );
    Navigator.push(context,route);
  }

  Future<void> navigateToAddPage()  async{
    final route = MaterialPageRoute(builder: (context) => AddMenuPage(),
    );
    await Navigator.push(context,route);
    setState(() {
      isLoading = true;
    });
   getMenus();
  }
  

   Future<void> getMenus() async {

    final url = 'http://10.0.2.2:5000/api/Menu';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if(response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['value'] as List;

      for (var menu in result) {
        final restID = menu['restID'].toString();

        final restResponse = await http.get(
          Uri.parse('http://10.0.2.2:5000/api/Restaurant/restID/$restID'),
        );

        if (restResponse.statusCode == 200) {
          final restJson = jsonDecode(restResponse.body);
          menu['restName'] =
            (restJson['value'] != null && restJson['value'].isNotEmpty)
              ? restJson['value'][0]['restName']
              : 'Unknown Restaurant';
        } else {
          menu['restName'] = 'Unknown Restaurant';
        }
      }

      setState(() {
        menus = result;
      });
    } else{
      //show error
    }
    setState(() {
      isLoading = false;
    });

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
