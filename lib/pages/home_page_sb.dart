import 'package:akrams_app/pages/login_page.dart';
import 'package:akrams_app/utils/constants.dart';
import 'package:akrams_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

//import 'package:akrams_app/namecard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HomePageSB extends StatelessWidget {

  /* var myText = "Change My Name";
  TextEditingController _nameController = TextEditingController(); */

  fetchData() async{

    var url = "https://jsonplaceholder.typicode.com/photos";

    var res = await http.get(url);
    var data = jsonDecode(res.body);
    return data;
  }

  Stream <List<String>> getStream(){
    var data = Stream <List<String>>.fromIterable([
      List<String>.generate(20, (index) => "Item $index")
    ]);
    return data;
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
      body: StreamBuilder(
        stream: getStream(),
        // ignore: missing_return
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
              return Center(
                child: Text("We need to fetch something"),
            );
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
            );
            case ConnectionState.done:
              if (snapshot.error){
                return Center(
                child: Text("Some error has occured"),
                );
              }
              else {
                ListView.builder(
                itemBuilder: (context, index){
                 return ListTile(
                  title: Text(snapshot.data[index]),
                  
                  );
                }, 
              itemCount: snapshot.data.length,);
              }
          }
        },
        ),
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
