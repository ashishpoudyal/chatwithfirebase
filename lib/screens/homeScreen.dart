import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalfirechatapp/methods/methods.dart';
import 'package:finalfirechatapp/screens/chatroom.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? userMap;
  bool isLoading = false;
  final TextEditingController _search = TextEditingController();

  void onSearch() async {
    setState(() {
      isLoading = true;
    });
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    await _firestore
        .collection('users')
        .where("email", isEqualTo: _search.text)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
      print(userMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
          actions: [
            IconButton(
                onPressed: () => logOut(context), icon: Icon(Icons.logout))
          ],
        ),
        body: isLoading
            ? Center(
                child: SizedBox(
                  height: size.height / 20,
                  width: size.height / 20,
                  child: const CircularProgressIndicator(),
                ),
              )
            : Column(
                children: [
                  SizedBox(
                    height: size.height / 20,
                  ),
                  Container(
                      height: size.height / 14,
                      width: size.width,
                      alignment: Alignment.center,
                      child: Container(
                        height: size.height / 14,
                        width: size.width / 1.15,
                        child: TextField(
                          controller: _search,
                          decoration: InputDecoration(
                            hintText: "search",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  ElevatedButton(
                    onPressed: onSearch,
                    child: const Text("Search"),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  userMap != null
                      ? ListTile(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatRoom(),
                              )),
                          leading: const Icon(Icons.account_box,
                              color: Colors.black),
                          title: Text(
                            userMap!['name'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(userMap!['email']),
                          trailing: const Icon(Icons.chat, color: Colors.black),
                        )
                      : Container(),
                ],
              ));
  }
}
