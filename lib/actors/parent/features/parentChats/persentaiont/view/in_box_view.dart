import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:necessities/actors/parent/features/parentChats/data/chat_service.dart';
import 'package:necessities/actors/parent/features/parentChats/data/message_entity.dart';
import 'package:necessities/actors/parent/features/parentChats/data/models/chat_details_model/chat_details_model.dart';
import 'package:necessities/actors/parent/features/parentChats/data/models/socket_message_model/socket_message_model.dart';
import 'package:necessities/actors/parent/features/parentChats/persentaiont/widgets/ChatBublle.dart';
import 'package:necessities/actors/parent/widgets/appBar.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class InBoxView extends StatefulWidget {
  const InBoxView({
    super.key,
    required this.chatDetailsModel,
    required this.messagList,
  });
  final ChatDetailsModel chatDetailsModel;
  final List<MessageEntity> messagList;

  @override
  State<InBoxView> createState() => _InBoxViewState();
}

class _InBoxViewState extends State<InBoxView> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  bool _isScrolledToBottom = true;

  @override
  void initState() {
    super.initState();
    connect();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToEnd();
    });
    _scrollController.addListener(_onScroll);
  }

  List<MessageEntity> messages = [];
  late IO.Socket socket;

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        _isScrolledToBottom = true;
      });
    } else {
      setState(() {
        _isScrolledToBottom = false;
      });
    }
  }

  void connect() {
    String token = GetStorage().read('token');
    socket = IO.io('https://academiq.onrender.com/', {
      'transports': ['websocket'],
      'autoConnect': false,
      'extraHeaders': {'Authorization': 'Bearer $token'}
    });

    socket.connect();

    socket.on('connect', (data) {
      print('Connected to Socket.IO server');
    });

    socket.on('disconnect', (data) {
      print('Disconnected from Socket.IO server');
    });

    socket.on('error', (error) {
      print('Error occurred: $error');
    });

    socket.on('onlineUsers', (data) {
      print('Online users: $data');
    });

    socket.on('userDisconnected', (data) {
      print('User disconnected: $data');
    });

    socket.on('userConnected', (data) {
      print('User connected: $data');
    });

    socket.on('newMessage', (data) {
      SocketMessageModel socketMessageModel = SocketMessageModel.fromJson(data);
      setState(() {
        messages.add(socketMessageModel);
        if (_isScrolledToBottom) {
          _scrollToEnd();
        }
      });
    });

    socket.on('newNotification', (data) {
      print('New notification: $data');
    });
  }

  void sendMessage({required String chatId, required String content}) async {
    socket.emit('sendMessage', {'chatId': chatId, 'content': content});
    await Future.delayed(Duration(milliseconds: 200)); // wait for 100ms
    if (_isScrolledToBottom) {
      _scrollToEnd();
    }
  }

  void _scrollToEnd() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    socket.disconnect();
    socket.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildParentAppBar(context) as PreferredSize,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 12,
          ),
          UserInChanDetails(
            chatDetailsModel: widget.chatDetailsModel,
          ),
          const SizedBox(
            height: 8,
          ),
          Divider(
            color: Colors.grey[400],
            height: 20,
            thickness: 1,
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: widget.messagList.length + messages.length,
              itemBuilder: (context, index) {
                MessageEntity message;
                if (index < widget.messagList.length) {
                  message = widget.messagList[index];
                } else {
                  message = messages[index - widget.messagList.length];
                }
                return message.userId == GetStorage().read('id')
                    ? ChatBublleForMe(
                        messageModel: message,
                      )
                    : ChatBublle(
                        messageModel: message,
                      );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Type your message...',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (socket.connected) {
                      ChatService().postMessage(
                          chatId: widget.chatDetailsModel.id,
                          message: _textController.text);
                      sendMessage(
                          chatId: widget.chatDetailsModel.id!,
                          content: _textController.text);
                      _textController.clear();
                      _scrollToEnd();
                    } else {
                      print('Socket not connected');
                    }
                  },
                ),
              ),
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              maxLines: null, // Allow the text field to expand vertically
              keyboardType: TextInputType.multiline,
            ),
          )
        ],
      ),
    );
  }
}

class UserInChanDetails extends StatelessWidget {
  const UserInChanDetails({
    super.key,
    required this.chatDetailsModel,
  });
  final ChatDetailsModel chatDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 12,
        ),
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              color: const Color.fromRGBO(206, 195, 255, 1)),
          child: Image.asset('assets/images/manAvtar.png'),
        ),
        const SizedBox(
          width: 6,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                '${chatDetailsModel.member!.name!.first} ${chatDetailsModel.member!.name!.last}',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                    color: Color.fromRGBO(42, 43, 44, 1))),
            const Row(
              children: [
                CircleAvatar(
                  radius: 4.0,
                  backgroundColor: Colors.green,
                ),
                SizedBox(
                  width: 4,
                ),
                Text('online',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'poppins',
                        color: Color.fromRGBO(85, 85, 86, 1))),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
