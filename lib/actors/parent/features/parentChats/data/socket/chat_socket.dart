import 'package:get_storage/get_storage.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatSocket {
  late IO.Socket socket;

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

    // socket.on('your_event', (data) {
    //   print('Received event: $data');
    // });
  }

  void sendMessage({required String chatId, required String content}) {
    socket.emit(
        'message', {'chatId': '665b545972ac234114e693a5', 'content': 'Hiii'});
  }
}
