import 'package:book_time/Factory/FactoryBook.dart';
import 'package:book_time/app/homePage/homePage_view.dart';
import 'package:book_time/domain/repositories/BookInterface.dart';
import 'package:book_time/domain/entity/Book.dart';
import 'package:book_time/domain/entity/User.dart';
import 'package:book_time/profilePage.dart';
import 'package:book_time/signIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Book Time',
      theme: ThemeData.dark(),
      home: new _LoginState(),
    );
  }
}

class _LoginState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginControlsState();
}

class _LoginControlsState extends State<_LoginState> {

  User currentUser = new User();


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
                          Text('Connexion', style: TextStyle(color: Colors.white, fontFamily: 'Fredock', fontSize: 25),),
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
                                            currentUser.email = email;
                                          },
                                          onSubmitted: (String email){
                                            if(email.isNotEmpty){
                                              currentUser.email = email;
                                            }else(
                                              Text('wrong email')
                                            );
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
                                            currentUser.pass = pass;
                                          },
                                          onSubmitted: (String pass){
                                            if(pass != "" && pass.length > 6){
                                              currentUser.pass = pass;
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
                        if(currentUser.email != null && currentUser.pass != null){
                          _handleSumitted(currentUser);
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
                                "Se connecter",
                                style: TextStyle(fontSize: 20, fontFamily: "Fredock")
                            ),
                          )
                      ),
                    )
                ),
                Center(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
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
                )]
            )
      )
    );

  }

  void showToast(String msg, BuildContext context, {int duration, int gravity, Color color}) {
    Toast.show(msg, context, duration: duration, gravity: gravity, backgroundColor: color);
  }


  void _handleSumitted(User content) async {

    var settings = new ConnectionSettings(
      host: 'cappedorian.fr',
      port: 3306,
      user: 'c1453962c_root',
      password: 'fiduide161100',
      db: 'c1453962c_BookTime',
    );

    var connection = await MySqlConnection.connect(settings);

    Results results = await connection.query(
        "SELECT * FROM utilisateur WHERE email = ?",
        [content.email]).catchError((e) {
      print(e);
      print('ERRRRRRRRRRRRRRRRROOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOORRRRRRRRRRRRRRRRRRRRRRRRRRRRR');
      return false;
    });

    User query = new User();

    for (var table in results.toList()) {
      query.idUser = table[0].toString();
      query.email = table[1].toString();
      query.pass = table[2].toString();
    }

    if(query.email == content.email && query.pass == content.pass){
      Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
        return HomePage(currentUser: query);
      }));
    }else {
      showToast("Vos informations sont incorrecte", context, gravity: Toast.CENTER,
          duration: Toast.LENGTH_LONG,
          color: Colors.red[900]);
    }

  }

  }



