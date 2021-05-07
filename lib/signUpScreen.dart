import 'package:flutter/material.dart';
import 'package:test_request/UsefullFunc.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Окно регистрации пользователя"),
      ),
      body: SignUpForm(),
    );
  }
}

class SignUpForm extends StatefulWidget {

  @override
  _SignUpFormState createState() => _SignUpFormState();
}



class _SignUpFormState extends State<SignUpForm> {
  final _signUpFormKey = GlobalKey<FormState>();
  String _newEmail;
  String _newPassword;
  String _passw1, _passw2;
  String _name;



  @override
  Widget build(BuildContext context) {


    return Center(
        child: Form(
        key: _signUpFormKey,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Имя пользователя"),
                TextFormField(
                  validator: (value){_name=value;},
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Email"),
                TextFormField(
                  validator: (value){
                    _newEmail=value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Пароль"),
                TextFormField(
  obscureText: true,
                  validator: (value){
                    _passw1=value;
                  },

                ),
                SizedBox(
                  height: 10,
                ),
                Text("Повтор пароля"),
                TextFormField(
obscureText: true,
                  validator: (value){
                    _passw2=value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(onPressed: (){
                  if (_signUpFormKey.currentState.validate()){
                    if (_passw1!=_passw2){
                      MyUsefull.ShowMySnack(context, "Пароли не совпадают", Colors.red);
                    }
                    if ((_newEmail=="")||(!_newEmail.contains("@"))){
                      MyUsefull.ShowMySnack(context, "Не правильно введен Email", Colors.red);
                    }

                    if ((_passw1==_passw2)&&(_newEmail!="")){
                      if (_passw1.length<8){
                        MyUsefull.ShowMySnack(context, "Пароль слишком прост", Colors.redAccent);
                      }
                      else {
                        MyUsefull.ShowMySnack(
                            context, "Регистрирую нового пользователя",
                            Colors.green);
                        print(MyUsefull.MakeSHAFromPassword(_passw1));
                        print(MyUsefull.MakeSHAFromPassword(_passw2));

                        MyUsefull.SaveUserToDB(_name,_newEmail,_passw1);
                        //Save user to DB
                        Navigator.popAndPushNamed(context, '/signInScreen');
                      }
                    }
                  }
                },
                    child: Text("Зарегистрироваться"))
                ]
          ),
      )
    );
  }
}
