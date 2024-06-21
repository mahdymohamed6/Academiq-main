import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:necessities/actors/parent/features/parentChats/data/message_entity.dart';
import 'package:necessities/actors/parent/features/parentChats/data/models/chat_details_model/chat_details_model.dart';
import 'package:necessities/actors/parent/features/parentChats/data/models/message_model/message_model.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/resources/user_data.dart';

class ChatService {
  Future<List<ChatDetailsModel>> fetchChats() async {
// final url = Uri.parse('http://13.60.57.85/users/65f8a5413a9824148869700c');
    String token = UserData().getToken();
    final url = Uri.parse('${baseUrl}chats');

    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
    List<ChatDetailsModel> chatDetailsList = [];
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      List<dynamic> chats = responseData['chats'];
      print(token);
      for (var chat in chats) {
        ChatDetailsModel chatDetailsModel = ChatDetailsModel.fromJson(chat);
        chatDetailsList.add(chatDetailsModel);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      print(response.body);
    }
    return chatDetailsList;
  }

  Future<List<MessageEntity>> fetchChatMessages({required chatId}) async {
// final url = Uri.parse('http://13.60.57.85/users/65f8a5413a9824148869700c');
    String token = UserData().getToken();
    final url = Uri.parse('${baseUrl}chats/$chatId/messages');
    // print('${chatId} HEEEEEEEEER');
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
    List<MessageEntity> messageList = [];
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      List<dynamic> messages = responseData['messages'];
      for (var message in messages) {
        MessageModel messageModel = MessageModel.fromJson(message);
        messageList.add(messageModel);
      }
      //  print(messageList[0].content);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      print(response.body);
      print(chatId);
    }
    return messageList;
  }

  Future<void> postMessage({required chatId, required message}) async {
// final url = Uri.parse('http://13.60.57.85/users/65f8a5413a9824148869700c');
    String token = UserData().getToken();
    final url = Uri.parse('${baseUrl}chats/$chatId/messages');

    var body = jsonEncode({"content": message});
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 201) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      // print(responseData);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      print(response.body);
    }
  }
}
