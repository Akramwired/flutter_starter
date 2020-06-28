import 'package:flutter/material.dart';


class NameCard extends StatelessWidget {
  const NameCard({
    Key key,
    @required this.myText,
    @required TextEditingController nameController,
  }) : _nameController = nameController, super(key: key);

  final String myText;
  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/girl_coding.jpg'),
          SizedBox(
            height: 5,
          ),
          Text(
            myText, 
            style: TextStyle(
              fontSize: 25, 
              fontWeight: FontWeight.bold
              ),
              ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your name",
              labelText: "Name"
              ),
            ),
          ),
        ],
      ),
    );
  }
}