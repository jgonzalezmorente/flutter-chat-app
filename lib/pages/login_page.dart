import 'package:chat/widgets/boton_azul.dart';
import 'package:flutter/material.dart';

import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';



class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Logo( titulo: 'Messenger' ),
                
                _Form(),
                
                Labels( 
                  ruta: 'register',
                  titulo: '¿No tienes cuenta?',
                  subtitulo: 'Crea una ahora!'
                ),
                
                Text( 'Términos y condiciones de uso', style: TextStyle( fontWeight: FontWeight.w400 ) ),
                
              ],
            ),
          ),
        ),
      ),
   );
  }
}


class _Form extends StatefulWidget {  

  @override
  __FormState createState() => __FormState();

}

class __FormState extends State<_Form> {

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only( top: 40 ),
      padding: EdgeInsets.symmetric( horizontal: 50 ),

      child: Column(
        children: [

          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress, 
            textController: this.emailCtrl,
          ),

          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',            
            textController: this.passCtrl,
            isPassword: true,
          ),

          BotonAzul(
            text: 'Ingrese', 
            onPressed: () {
              print( this.emailCtrl.text );
              print( this.passCtrl.text );
            }
          )
        ],
      ),
    );
  }
}

