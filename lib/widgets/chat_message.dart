import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat/services/auth_service.dart';
import 'package:flutter/widgets.dart';


class ChatMessage extends StatelessWidget {

  final String texto;
  final String uid;
  final AnimationController animationController;

  const ChatMessage({
    Key? key, 
    required this.texto, 
    required this.uid,
    required this.animationController
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    
    final authService = Provider.of<AuthService>( context, listen: false );

    return SizeTransition(
      sizeFactor: CurvedAnimation( parent: animationController, curve: Curves.easeOut ),
      child: FadeTransition(
        opacity: animationController,
        child: Container(
          child: ( this.uid == authService.usuario?.uid )
          ? _myMessage()
          : _notMyMessage()
        ),
      ),
    );
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all( 8.0 ),
        margin: EdgeInsets.only( left: 50, right: 5, bottom: 5 ),
        child: Text( this.texto, style: TextStyle( color: Colors.white ) ),
        decoration: BoxDecoration(
          color: Color(0xff4d93f6),
          borderRadius: BorderRadius.circular(20)
        ),
      )
    );
  }

  Widget _notMyMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all( 8.0 ),
        margin: EdgeInsets.only( left: 5, right: 50, bottom: 5 ),
        child: Text( this.texto, style: TextStyle( color: Colors.black87 ) ),
        decoration: BoxDecoration(
          color: Color(0xffe4e5e8),
          borderRadius: BorderRadius.circular(20)
        ),
      )
    );
  }
}

