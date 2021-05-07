import 'package:flutter/material.dart';
import 'package:test_request/UsefullFunc.dart';

class ResetPasswordScreen extends StatelessWidget {
  String _email;
  ResetPasswordScreen(this._email);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Окно смены пароля"),
      ),
      body: ResetPasswordForm(_email),
    );
  }
}

class ResetPasswordForm extends StatefulWidget {
  String _email;
  ResetPasswordForm(this._email);

  @override
  _ResetPasswordFormState createState() => _ResetPasswordFormState(_email);
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _ResetPasswordFormKey = GlobalKey<FormState>();
  String _myEmail;
  _ResetPasswordFormState(this._myEmail);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _ResetPasswordFormKey,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Сбросить пароль пользователю"),
              TextFormField(
                initialValue: _myEmail,
                validator: (value) {
                  if (value.isNotEmpty) {
                    _myEmail = value;
                  }
                  else {
                    _myEmail = "";
                  }
                },
              ),
              TextButton(
                onPressed: () {
                  if (_ResetPasswordFormKey.currentState.validate()) {
                    //Сгенерить новый пароль
                    var newPassword = MyUsefull.generateNewPassword();
                    print(MyUsefull.generateNewPassword());
                    print(MyUsefull.generateNewPassword());
                    MyUsefull.ShowMySnack(context,
                        "Новый пароль $newPassword выслан на почту $_myEmail",
                        Colors.green);
                  }
                },
                child: Text("Выслать новый пароль"),
              )
            ]
        ),
      ),
    );
  }
}
