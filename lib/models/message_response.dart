import 'dart:convert';

MessageResponse messageResponseFromJson(String str) => MessageResponse.fromJson(json.decode(str));

String messageResponseToJson(MessageResponse data) => json.encode(data.toJson());

class MessageResponse {
    MessageResponse({
      required this.ok,
      this.msg = '',
    });

    bool ok;
    String msg;

    factory MessageResponse.fromJson(Map<String, dynamic> json) => MessageResponse(
        ok: json['ok'],
        msg: json['msg'],
    );

    Map<String, dynamic> toJson() => {
        'ok': ok,
        'msg': msg,
    };
}
