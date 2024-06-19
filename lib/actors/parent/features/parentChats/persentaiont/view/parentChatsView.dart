import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/parentChats/data/chat_service.dart';
import 'package:necessities/actors/parent/features/parentChats/data/message_entity.dart';
import 'package:necessities/actors/parent/features/parentChats/data/models/chat_details_model/chat_details_model.dart';
import 'package:necessities/actors/parent/features/parentChats/data/models/message_model/message_model.dart';
import 'package:necessities/actors/parent/features/parentChats/persentaiont/view/in_box_view.dart';
import 'package:necessities/actors/parent/features/parentChats/persentaiont/widgets/paretnChatsListViewCard.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/Drawerr.dart';
import 'package:necessities/actors/parent/widgets/appBar.dart';
import 'package:necessities/actors/parent/widgets/customizedSearchBar.dart';
import 'package:necessities/constants.dart';

class ParentChatsView extends StatefulWidget {
  const ParentChatsView({Key? key}) : super(key: key);

  @override
  State<ParentChatsView> createState() => _ParentChatsViewState();
}

class _ParentChatsViewState extends State<ParentChatsView> {
  @override
  List<ChatDetailsModel> chatDetailsList = [];
  bool isLoadng = true;
  @override
  void initState() {
    getChats();
    // TODO: implement initState
    super.initState();
  }

  Future<void> getChats() async {
    isLoadng = true;
    var _chatDetailsList = await ChatService().fetchChats();
    setState(() {
      chatDetailsList = _chatDetailsList;
    });
    isLoadng = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        child: Drawerr(),
      ),
      backgroundColor: Colors.white,
      appBar: buildParentAppBar(context) as PreferredSize,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const CustomizedSearchBar(text: 'Search for teacher'),
            Expanded(
              child: isLoadng
                  ? Center(
                      child: CircularProgressIndicator(
                        color: primaryColor1,
                      ),
                    )
                  : ListView.builder(
                      itemCount: chatDetailsList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () async {
                              List<MessageEntity> messagList =
                                  await ChatService().fetchChatMessages(
                                      chatId: chatDetailsList[index].id);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InBoxView(
                                            chatDetailsModel:
                                                chatDetailsList[index],
                                            messagList: messagList,
                                          )));
                            },
                            child: ParetnChatsListViewCard(
                              chatDetailsModel: chatDetailsList[index],
                            ));
                      }),
            )
          ],
        ),
      ),
    );
  }
}
