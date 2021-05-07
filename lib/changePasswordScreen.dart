
import 'package:flutter/material.dart';
import 'UsefullFunc.dart';

class ChangePasswordScreen extends StatelessWidget {
  String _email_change;
  ChangePasswordScreen({String email}):_email_change = email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Окно смены пароля"),
      ),
      body: ChangePasswordForm(_email_change),
    );
  }
}

class ChangePasswordForm extends StatefulWidget {
  String _email_ch;
  ChangePasswordForm(this._email_ch);


  @override
  _ChangePasswordFormState createState() => _ChangePasswordFormState(_email_ch);
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _ChangePasswordFormKey = GlobalKey<FormState>();
  String _my_email;
  String _newPassword,_newPassword2,_oldInputPassword;
  _ChangePasswordFormState(this._my_email);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _ChangePasswordFormKey,
        child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Меняем пароль пользователю"),
          TextFormField(
            initialValue: _my_email,
            validator: (value){
              _my_email = value;
            },
          ),

          Text("Старый пароль"),
        TextFormField(
            validator: (value){
              if (value.length>=8){
              _oldInputPassword = value;
              print("validate $_oldInputPassword");
              }
              else{
                return "Старый пароль должен содержать от 8 символов";
              }
            }
        ),
          Text("Новый пароль"),
          TextFormField(
            validator: (value){
              if (value.length>=8) {
                _newPassword = value;
              }
              else{
                return "Новый пароль должен содержать от 8 символов";
              }
            }
          ),
          Text("Повтор нового пароля"),
          TextFormField(
              validator: (value) {
                if (value.length >= 8) {
                  _newPassword2 = value;
                }
                else {
                  return "Новый пароль должен содержать от 8 символов";
                }
              }
          ),

          TextButton(onPressed: () async {
            if (_ChangePasswordFormKey.currentState.validate()){
                var _oldInputPasswSHA = MyUsefull.MakeSHAFromPassword(_oldInputPassword);
                var _newPasswordSHA = MyUsefull.MakeSHAFromPassword(_newPassword);
                var _oldPasswordSHA = await MyUsefull.LoadUserPasswordFromDB(_my_email);

                if (_oldInputPasswSHA != _oldPasswordSHA){
                  MyUsefull.ShowMySnack(context, "Старый пароль введен не верно. Если вы его не помните, то его надо сбросить.", Colors.red);
                  // return;
                }
                if (_newPassword!=_newPassword2){
                  MyUsefull.ShowMySnack(context, "Пароли не совпадают", Colors.red);
                }
                else{

                  if (_oldPasswordSHA == _newPasswordSHA){
                    MyUsefull.ShowMySnack(context, "Такой пароль уже установлен", Colors.red);
                  }
                  else{
                    MyUsefull.ShowMySnack(context, "Пароль успешно изменен", Colors.green);
                    MyUsefull.UpdatePasswordForUser(_my_email,_newPasswordSHA);
                  }
                }
              }
            }, child: Text("Сменить пароль"))

          ]
      ),
    )
    );
  }
}

