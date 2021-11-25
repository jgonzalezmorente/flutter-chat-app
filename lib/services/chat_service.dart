import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:chat/global/environment.dart';

import 'package:chat/models/mensajes_response.dart';
import 'package:chat/models/usuario.dart';

import 'auth_service.dart';



class ChatService with ChangeNotifier {

  Usuario? usuarioPara;


  Future<List<Mensaje>> getChat( String usuarioId ) async {

    try {
      
      final resp = await http.get( Uri.parse('${ Environment.apiUrl }/mensajes/$usuarioId'),
      headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken() ?? ''
      });

        final mensajesResponse = mensajesResponseFromJson( resp.body );
        return mensajesResponse.mensajes;
        
        } catch (e) {
      return [];
    }
    }

  }