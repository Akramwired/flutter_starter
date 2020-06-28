import 'package:akrams_app/pages/login_page.dart';
import 'package:akrams_app/utils/constants.dart';
import 'package:akrams_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

//import 'package:akrams_app/namecard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HomePageFB extends StatefulWidget {
  static const String routeName = "/homefb";
  @override
  _HomePageFBState createState() => _HomePageFBState();
}

class _HomePageFBState extends State<HomePageFB> {

  /* var myText = "Change My Name";
  TextEditingController _nameController = TextEditingController(); */

  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;

  @override
  void initState() { 
    super.initState();
    fetchData();
  }

  fetchData() async{
    var res = await http.get(url);
    data = jsonDecode(res.body);
    setState(() {});
  }

  @override
  void dispose() { 
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Hi Akramwired'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Constants.prefs.setBool("loggedIn", false);
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            }, 
          )
        ],
      ),
      body: data != null 
      ? ListView.builder(
        itemBuilder: (context, index){
          return ListTile(
            title: Text(data[index]["title"]),
            subtitle: Text("ID\: ${data[index]["id"]}"),
            leading: Image.network(data[index]["url"]),
          );
        }, 
        itemCount: data.length,)
      : Center(
        child: CircularProgressIndicator(),)
        ,
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         /*  myText = _nameController.text;
          setState(() {}); */
        },
        child: Icon(Icons.send),
        ),
        
    );
  }
}
