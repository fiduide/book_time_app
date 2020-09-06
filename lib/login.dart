import 'package:book_time/Factory/FactoryBook.dart';
import 'file:///C:/Users/doria/Desktop/book_time/lib/domain/repositories/BookInterface.dart';
import 'package:book_time/Objet/User.dart';
import 'package:book_time/booktime.dart';
import 'package:book_time/profilePage.dart';
import 'package:book_time/signIn.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

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


  BookInterface adapterSource =  (FactoryAll(1)).adapterSource;


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
                              child: Text("Connexion", style: TextStyle(fontFamily: 'Fredock', fontSize: 40, fontWeight: FontWeight.bold),),
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
                                                  currentUser.email = email;
                                                },
                                                onSubmitted: (String email){
                                                  if(currentUser.email != ""){
                                                    currentUser.email = email;
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
                                                  currentUser.pass = pass;
                                                },
                                                onSubmitted: (String pass){
                                                  if(currentUser.pass != "" && currentUser.pass.length > 6){
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
                  ),
                )
              ],
            )
        ),
      ),
    );
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
        return ProfilePage(currentUser: query);
      }));
    }else {
      Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
        return HomePage();
      }));
    }

  }

  }



