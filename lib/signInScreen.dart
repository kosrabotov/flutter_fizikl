import 'package:flutter/material.dart';
import 'UsefullFunc.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Вход в систему"),

      ),
      body: SignInForm(),

      );
  }
}

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _signInFormKey = GlobalKey<FormState>();
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Form(
          key: _signInFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Введите Email"

              ),
              SizedBox(

                width: 500,
                height: 60,
                child: Container(
                  // padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(15),
                  color: Colors.green,
                  child: TextFormField(
                    // initialValue: "someemail@mail.com",
                    validator: (value){
                      _email = value;
                      if (value.isEmpty) return "Введите email";
                      if (!value.contains("@")) return "Адрес должен содержать @";

                    },
                  ),
                ),

              ),
              Text("Введите пароль",


              ),
              SizedBox(
                width: 500,
                height: 60,
                child: Container(
                  margin: EdgeInsets.all(15),
                  color: Colors.red,
                  child: TextFormField(
                    obscureText: true,
                    // initialValue: "",
                    validator: (value){
                      if (value.isEmpty) return "Введите пароль";
                      else {
                        _password = value;
                      }
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () async {
                      if (_signInFormKey.currentState.validate()){
                        var _savedPassword = await MyUsefull.LoadUserPasswordFromDB(_email);
                        if (_savedPassword == "not found"){
                          MyUsefull.ShowMySnack(context, "Пользователь $_email не зарегистрирован", Colors.red);
                          return;
                        }
                        print ("Для пользователя $_email найден пароль $_savedPassword");
                        print("Вход $_email c паролем $_password");
                        print (MyUsefull.MakeSHAFromPassword(_password));
                        if (_savedPassword == MyUsefull.MakeSHAFromPassword(_password)) {
                          MyUsefull.ShowMySnack(
                              context, "Вход разрешен", Colors.green);
                        }
                        else{
                          MyUsefull.ShowMySnack(context, "Пользователь $_email не найден или пароль не верен", Colors.red);
                        }
                        // Scaffold.of(context).showSnackBar(SnackBar(
                        //   content: Text("Вход разрешен"),
                        //   backgroundColor: Colors.green,
                        // ));
                      }

                    },
                  child: Text("Войти"),
                  ),
                  SizedBox(
                    width:50,
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context,"/signUpScreen");
                    },
                    child: Text("Зарегистрироваться"),
                  ),

                ],
              ),
              SizedBox(
                width:50,
              ),
              TextButton(
                onPressed: (){
                  if (_email == null) _email = "";
                  Navigator.pushNamed(context,"/changePasswordScreen/$_email");
                },
                child: Text("Сменить пароль"),
              ),
              SizedBox(
                width:50,
              ),
              TextButton(
                onPressed: (){
                  if (_email == null) _email = "";
                  Navigator.pushNamed(context,"/resetPasswordScreen/$_email");
                },
                child: Text("Сбросить пароль"),
              ),



            ],
          ),
        )

    );
  }
}

