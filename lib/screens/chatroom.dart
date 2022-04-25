import 'package:flutter/material.dart';

class ChatRoom extends StatelessWidget {
  final TextEditingController _message = TextEditingController();
  ChatRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("name"),
      ),
      body: Container(),
      bottomNavigationBar: Container(
        height: size.height / 10,
        width: size.width,
        alignment: Alignment.center,
        child: Container(
          height: size.height / 12,
          width: size.width / 1.1,
          alignment: Alignment.center,
          child: Row(
            children: [
              Container(
                height: size.width / 12,
                width: size.width / 1.5,
                child: TextField(
                  controller: _message,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.send),
              )
            ],
          ),
        ),
      ),
    );
  }
}
