import 'dart:developer';
import 'package:book_time/Factory/FactoryBook.dart';
import 'package:book_time/domain/repositories/BookInterface.dart';
import 'package:book_time/domain/entity/Book.dart';
import 'package:book_time/domain/entity/User.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:toast/toast.dart';
import 'login.dart';

class SignIn extends StatelessWidget {

  User newUser = new User();


  BookInterface bookSource =  (FactoryAll(1)).bookSource;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255,199,199,199),
                          blurRadius: 150.0,
                          offset: Offset(0,5)
                      )
                    ]
                ),
                margin: EdgeInsets.only(top: 75),
                child: Text('BookTime', style: TextStyle(color: Colors.grey[200], fontFamily: 'Fredock', fontSize: 35),),
              ),
              Padding(
                padding: EdgeInsets.only(top: 150.0),
                child: Form(
                    child: Column(
                      children: [
                        Text('Inscription', style: TextStyle(color: Colors.white, fontFamily: 'Fredock', fontSize: 25),),
                        Container(
                          margin: EdgeInsets.all(30.0),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:  Colors.grey,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255,199,199,199),
                                )
                              ]
                          ),
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(bottom:BorderSide(color: Colors.grey))
                                  ),
                                  child: Column(
                                    children: [
                                      TextField(
                                        onChanged: (String email){
                                          if(email.isNotEmpty && RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)){
                                            newUser.email = email;
                                            showToast("Adresse mail correcte", context, gravity: Toast.CENTER, duration: Toast.LENGTH_LONG, color: Colors.green[900] );
                                          }else{
                                            showToast("Veuillez saisir une adresse email valide", context, gravity: Toast.CENTER, duration: Toast.LENGTH_LONG, color: Colors.red[900] );
                                          }
                                        },
                                        onSubmitted: (String email){
                                          if(email.isNotEmpty && !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)){
                                            newUser.email = email;
                                          }else{
                                            showToast("Veuillez saisir une adresse email valide", context, gravity: Toast.CENTER, duration: Toast.LENGTH_LONG, color: Colors.red[900] );
                                          }
                                        },
                                        style: TextStyle(color: Colors.black38),
                                        decoration: InputDecoration(
                                            hintText: 'Email',
                                            hintStyle: TextStyle(color:  Color.fromARGB(255,199,199,199))
                                        ),
                                      )

                                    ],
                                  )
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 30, right: 30),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:  Colors.grey,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255,199,199,199),
                                )
                              ]
                          ),
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(bottom:BorderSide(color: Colors.grey[400]))
                                  ),
                                  child: Column(
                                    children: [
                                      TextField(
                                        onChanged: (String pass){
                                          if(pass.isNotEmpty) {
                                            newUser.email = pass;
                                            showToast("Mot de passe correcte", context, gravity: Toast.CENTER, duration: Toast.LENGTH_LONG, color: Colors.green[900] );
                                          }
                                          if(pass.length < 6){
                                            showToast("Mot de passe inférieur à 6 caractères", context, gravity: Toast.CENTER, duration: Toast.LENGTH_LONG, color: Colors.red[900] );
                                          }
                                        },
                                        onSubmitted: (String pass){
                                          if(pass.isEmpty){
                                            showToast("Veuillez saisir un mot de passe", context, gravity: Toast.CENTER, duration: Toast.LENGTH_LONG, color: Colors.red[900] );
                                          }
                                          if(pass.length < 6){
                                            showToast("Votre mot de passe doit posséder 6 caractères minimum", context, gravity: Toast.CENTER, duration: Toast.LENGTH_LONG, color: Colors.red[900] );
                                          }
                                          if(pass.isNotEmpty && pass.length > 6){
                                            newUser.pass = pass;
                                          }
                                        },

                                        style: TextStyle(color: Colors.black38),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Mot de passe',
                                            focusColor: Colors.grey,
                                            hintStyle: TextStyle(color:  Color.fromARGB(255,199,199,199))
                                        ),
                                      )

                                    ],
                                  )
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                ),
              ),
                            SizedBox(height: 30.0,),
                            Center(
                                child: FlatButton(
                                  onPressed: () async {
                                    if(newUser.email != null && newUser.pass != null) {
                                      _handleSumitted(context, newUser);
                                    }
                                  },
                                  padding: const EdgeInsets.all(0.0),
                                  textColor: Colors.white,
                                  child: Container(
                                      margin: EdgeInsets.only(top: 10),
                                      height: 50,
                                      width: 200,
                                      decoration:  BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          gradient: LinearGradient(
                                              colors: [
                                                Color.fromARGB(255,142,143, 147),
                                                Color.fromARGB(255,174,176, 180),
                                                Color.fromARGB(255,206,208, 209)
                                              ]
                                          )
                                      ),
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: const Text(
                                            "S'inscrire",
                                            style: TextStyle(fontSize: 20, fontFamily: "Fredock")
                                        ),
                                      )
                                  ),
                                )
                            ),
                            Center(
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                                  },
                                  padding: const EdgeInsets.all(0.0),
                                  textColor: Colors.white,
                                  child: Container(
                                      margin: EdgeInsets.only(top: 10),
                                      height: 50,
                                      width: 200,
                                      decoration:  BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          gradient: LinearGradient(
                                              colors: [
                                                Color.fromARGB(255,142,143, 147),
                                                Color.fromARGB(255,174,176, 180),
                                                Color.fromARGB(255,206,208, 209)
                                              ]
                                          )
                                      ),
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: const Text(
                                            "Retour",
                                            style: TextStyle(fontSize: 20, fontFamily: "Fredock")
                                        ),
                                      )
                                  ),
                                )
                            )]
                      ),
                    )
            );
  }

  void showToast(String msg, BuildContext context, {int duration, int gravity, Color color}) {
    Toast.show(msg, context, duration: duration, gravity: gravity, backgroundColor: color);
  }

  void _handleSumitted(context, User content) async {
    if (content.pass.length < 6) {
      showToast(
          "Votre mot de passe doit posséder 6 caractères minimum", context,
          gravity: Toast.CENTER,
          duration: Toast.LENGTH_LONG,
          color: Colors.red[900]);
    }else {
      if (await bookSource.addUser(content) == true) {
        showToast(
            "Votre compte a été créé avec succès", context,
            gravity: Toast.CENTER,
            duration: Toast.LENGTH_LONG,
            color: Colors.green[900]);
      } else {
        showToast("Compte déjà existant...", context, gravity: Toast.CENTER,
            duration: Toast.LENGTH_LONG,
            color: Colors.red[900]);
      }
    }
  }
}


