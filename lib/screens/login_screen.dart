import 'package:finalfirechatapp/methods/methods.dart';
import 'package:finalfirechatapp/screens/create_account.dart';
import 'package:finalfirechatapp/screens/homeScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: isLoading
          ? Center(
              child: Container(
                  height: size.height / 20,
                  width: size.width / 20,
                  child: CircularProgressIndicator()))
          : Column(
              children: [
                SizedBox(
                  height: size.height / 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: size.width / 1.1,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                ),
                SizedBox(
                  height: size.height / 50,
                ),
                Container(
                  width: size.width / 1.1,
                  child: Text(
                    "Welcome",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: size.width / 1.3,
                  child: Text(
                    "Sign in to continue",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: size.height / 10,
                ),
                Container(
                  width: size.width,
                  alignment: Alignment.center,
                  child: field(size, "email", Icons.account_box, _email),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    width: size.width,
                    alignment: Alignment.center,
                    child: field(size, "password", Icons.lock, _password),
                  ),
                ),
                SizedBox(
                  height: size.height / 10,
                ),
                customButton(size),
                SizedBox(
                  height: size.height / 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateAccount(),
                        ));
                  },
                  child: Text(
                    "Create Account ",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
    );
  }

  Widget customButton(Size size) {
    return GestureDetector(
      onTap: () {
        if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
          setState(() {
            isLoading = true;
          });
          logIn(_email.text, _password.text).then((user) {
            if (user != null) {
              print("Login sucessfull");
              setState(() {
                isLoading = false;
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            } else {
              print("Login failed");
              setState(() {
                isLoading = false;
              });
            }
          });
        } else {}
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        alignment: Alignment.center,
        height: size.height / 10,
        width: size.width / 1.2,
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget field(
      Size size, String hintText, IconData icon, TextEditingController cont) {
    return Container(
      height: size.height / 15,
      width: size.width / 1.1,
      child: TextField(
        controller: cont,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon),
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
