import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fonts/google_fonts.dart';

class chat2 extends StatefulWidget {
   chat2({super.key});


  @override
  State<chat2> createState() => _chat2State();
}

class _chat2State extends State<chat2> {
  List<types.Message> _messages = [];
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _handlePreviewDataFetched(
      types.TextMessage message,
      types.PreviewData previewData,
      ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
body: SingleChildScrollView(
  child:   Container(
  
    height: 896,
  
    child: Column(
  
      children: [
  
        Container(
  
  
  
          height: 200,
  
          width: 400,
  
          padding: EdgeInsets.only(top: 70,left: 26),
  
          decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(20)),
  
          child: Column(
  
            crossAxisAlignment: CrossAxisAlignment.start,
  
            children: [
  
              Text("< Back",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xff1C1F1E)),),
  
              SizedBox(height: 20,),
  
  
  
              Container(
  
                padding: EdgeInsets.only(right: 26),
  
                child: Row(
  
                  children: [
  
                    Container(
  
                      height: 45,
  
                        width: 45,
  
                        decoration: BoxDecoration(color:Colors.grey,borderRadius: BorderRadius.circular(5) ),
  
                        child: SvgPicture.asset("assets/logo/female-doctor-icon.svg")),
  
                    SizedBox(width: 8,),
  
                    Column(
  
                      crossAxisAlignment: CrossAxisAlignment.start
  
                      ,
  
                      children: [
  
                        Text(args["name"],style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w400,color: Color(0xff1C1F1E)),),
  
                        SizedBox(height: 2,),
  
                        Text(args["des"],style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w400,color: Color(0xff1C1F1E)),),
  
                      ],
  
                    ),
  
                    Spacer(),
  
                    Container(
  
                      height: 40,
  
                      width: 40,
  
                      decoration: BoxDecoration(color: Color(0xff6295E2),borderRadius: BorderRadius.circular(8)),
  
                      child: Icon(Icons.call,color: Color(0xffFFFFFF),),
  
                    ),
  
                  ],
  
                ),
  
              ),
  
  
  
            ],
  
          ),
  
  
  
        ),
  
  
  
        Container(
  
  height: 670,
  
          child: Chat(messages: _messages, onSendPressed: _handleSendPressed,onPreviewDataFetched:_handlePreviewDataFetched,user: _user,
  
            showUserAvatars: true,
  
            showUserNames: true,
  
          ),
  
        ),
  
      ],
  
    ),
  
  ),
),
    );
  }
}
