import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'dart:math';

class MyUsefull {
  static void ShowMySnack(BuildContext context, String text, Color color){
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: color,
    ));
  }

  static void SaveUserToDB(String name, String newEmail, String passw1) async {
      //Временно сохраню в файл
      String result = "$newEmail;${MakeSHAFromPassword(passw1)}";
      String data = await readUsers();
      if (!data.contains(result)){
        data = data+"/n"+result;
        await writeUsers(data);
      }

  }

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future <File> get _localFile async {
    final path = await _localPath;
    return File('$path/users.txt');
  }

  static Future<String> readUsers() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      return contents;
    }
    catch (e){
      return "Ошибка в загрузке пользователей";
    }
  }

  static Future <File> writeUsers(String data) async {
    final file = await _localFile;
    return file.writeAsString(data);
  }


  static Future<String> LoadUserFromDB() async {
    String data = await readUsers();
    return data;
  }

  static Future<String> LoadUserPasswordFromDB(String newEmail) async{
    // print(newEmail);

    String data = await LoadUserFromDB();
    // print(data);
    List<String> users = data.split('/n');
    // print (users);
    var passw = "not found";
    for (var i=0; i<users.length; i++){
      print(users[i]);
      if (users[i].contains(newEmail)){
        passw = users[i].split(";")[1];
      }
    }
    return passw;
  }


  static String MakeSHAFromPassword(String passw){
    print("clean password $passw");
    var digest = sha256.convert(utf8.encode("StR0Ng%FuckingP#aswordForFizikl"+passw));
    print ("digest:$digest");
    return "$digest";

  }

  static void UpdatePasswordForUser(String my_email, String newPassword) async{

    String data = await LoadUserFromDB();
    String updatedData="";
    print(data);
    List<String> users = data.split('/n');
    print (users);
    var passw = "not found";
    for (var i=0; i<users.length; i++){
      print(users[i]);
      if (users[i].contains(my_email)){

        passw = users[i].split(";")[1];
        var updatedUser = users[i].replaceAll(passw, newPassword);
        updatedData = updatedData+"/n"+updatedUser;
      }

      else{
        updatedData=updatedData+"/n"+users[i];
      }
    }
    await writeUsers(updatedData);
    return ;
  }

  static String generateNewPassword() {
    String rand = "zxcvbnnmasdfghjklqwertyuiop1234567890QWERRTUUOPASDFGHJKLZXCVBBNM<>!@#%^&*()";
    String result = "";
    Random random = new Random();
    for (var i = 0; i<8; i++){
        var ch = rand[random.nextInt(rand.length)];
        result = result + ch;
    }
    return result;
  }
}