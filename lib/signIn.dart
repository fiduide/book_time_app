import 'package:book_time/Factory/FactoryBook.dart';
import 'package:book_time/domain/repositories/BookInterface.dart';
import 'package:book_time/domain/entity/Book.dart';
import 'package:book_time/domain/entity/User.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class SignIn extends StatelessWidget {


  User newUser = new User();


  BookInterface bookSource =  (FactoryAll(1)).bookSource;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 400.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/backSignIn.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          child: Container(
                            margin: EdgeInsets.only(top: 100),
                            child: Center(
                              child: Text("Inscription", style: TextStyle(fontFamily: 'Fredock', fontSize: 40, fontWeight: FontWeight.bold),),
                            ),
                          )
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(40.0),
                      child: Column(
                          children: [
                            Form(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color:  Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromARGB(255,199,199,199),
                                                blurRadius: 10.0,
                                                offset: Offset(0,5)
                                            )
                                          ]
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                  border: Border(bottom:BorderSide(color: Colors.grey[100]))
                                              ),

                                              child: Column(
                                                children: [
                                                  TextField(
                                                    onChanged: (String email){
                                                      newUser.email = email;
                                                    },
                                                    onSubmitted: (String email){
                                                      if(newUser.email != ""){
                                                        newUser.email = email;
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
                                      margin: EdgeInsets.only(top: 10),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color:  Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromARGB(255,199,199,199),
                                                blurRadius: 5.0,
                                                offset: Offset(0,5)
                                            )
                                          ]
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                  border: Border(bottom:BorderSide(color: Colors.grey[100]))
                                              ),

                                              child: Column(
                                                children: [
                                                  TextField(
                                                    onChanged: (String pass){
                                                      newUser.pass = pass;
                                                    },
                                                    onSubmitted: (String pass){
                                                      if(newUser.pass != "" && newUser.pass.length > 6){
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
                            SizedBox(height: 30.0,),
                            Center(
                                child: FlatButton(
                                  onPressed: () async {
                                    if(newUser.email != null && newUser.pass != null){
                                      _handleSumitted(newUser);
                                    }else{
                                      //TODO
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
              ],
            )
        ),
      ),
    );
  }

  void _handleSumitted(User content) async {

    await bookSource.addUser(content);
  }



  }


