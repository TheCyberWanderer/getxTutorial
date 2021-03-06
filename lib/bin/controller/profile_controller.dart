///O papel desse cara é controlar algumns dos estados globais usados pelaa aplicação


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/models/user_id.dart';

class ProfileController extends GetxController{
  UserId _user = Get.arguments;
  String _inputText = '';
  
  String get inputText => _inputText;
  UserId get user => _user ;

  onInputTextChange(String text) {
    this._inputText = text;
    print(this._inputText);
  }

  

  void goToBackWithData(){
    if(inputText.length > 0){
      Get.back(
        result: this._inputText
      );
    }else{
      showCupertinoModalPopup(context: Get.overlayContext!, builder: (_){
        return CupertinoActionSheet(
          title: Text('Error'),
          message: Text('TEU input estava errado, ele deve conter algum dado'),
          cancelButton: CupertinoActionSheetAction(onPressed: ()=> Get.back(), child: Text('Retornar')),
          
            // CupertinoActionSheet(
            //   title: Text('Error'),
            //   cancelButton: CupertinoActionSheetAction(onPressed: (_) => Get.back(), child: Text('Encerrar')),
            // )
          
        );
      });
      // Get.dialog(
      // AlertDialog(
      //   title: Text('ERROR'),
      //   content: Text('Coloque um valor válido'),
      // ));
    }
  }
}