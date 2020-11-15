import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  
  @override
    _LoginState createState() => new _LoginState();
}
class _LoginState extends State<Login>{
  final formKey = new GlobalKey<FormState>();
  String _email;
  String _password;
  bool validate() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
  Future Submit() async{
    try{
        if(validate())
        {
            final User  user= (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)).user;
            if(user!=null)
            print("Logged in : ${user.uid}");
            else
            print("Doesnt exist");
        }
    }
    catch(e)
    {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title:Text("Login")
        ),
      body : new Container(
        child: new Form(
        key: formKey,
        child:new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <widgets>[
            new TextFormField(
            decoration: new InputDecoration(labelText: "Email Id"),
            validator: (value) => value.isEmpty ? 'Email can\'t be empty':null ,
            onSaved:(value)=> _email = value,
          ),
          new TextFormField(
            decoration: new InputDecoration(labelText: "Password"),
            obscureText: true,
            validator: (value) => value.isEmpty ? 'Password can\'t be empty':null ,
            onSaved: (value) => _password=value,
          ),
          new RaisedButton(
            child: new Text('Login', style: new TextStyle(fontSize: 20.0)),
            onPressed: validateAndSubmit,
          ),
          new FlatButton(onPressed: moveToRegister, child: new Text('Not an User? Create an account.',style: new TextStyle(fontSize: 20.0),))

            ]
        ),
        )
      )
    );
      
  }
}
