import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/parentChats/data/models/chat_details_model/chat_details_model.dart';

class ParetnChatsListViewCard extends StatelessWidget {
  const ParetnChatsListViewCard({super.key, required this.chatDetailsModel});
  final ChatDetailsModel chatDetailsModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 5),
                child: Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: const Color.fromRGBO(206, 195, 255, 1)),
                  child: Image.asset('assets/images/manAvtar.png'),
                  // Image.asset('assets/images/manAvtar.png'),
                  //
                  //  Image.network('${chatDetailsModel.image!}'),
                  //
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '${chatDetailsModel.member!.name!.first} ${chatDetailsModel.member!.name!.last}',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'poppins',
                            color: Color.fromRGBO(42, 43, 44, 1))),
                    const SizedBox(
                      height: 1,
                    ),
                    Container(
                      width: 240,
                      child: Text(
                        // Get the ChatDetailsModel instance

                        (chatDetailsModel != null &&
                                chatDetailsModel.lastMessage != null &&
                                chatDetailsModel.lastMessage!.isNotEmpty)
                            ? chatDetailsModel.lastMessage!.last['content'] ??
                                'No content available'
                            : 'Start chatting',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'poppins',
                            color: Color.fromRGBO(148, 163, 184, 1)),
                        overflow: TextOverflow.ellipsis, // Add this line
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 8, bottom: 29),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${chatDetailsModel.createdAt!.hour}:00',
                      style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'poppins',
                          color: Color.fromRGBO(148, 163, 184, 1)),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          const Divider(
            color: Color.fromARGB(255, 198, 197, 197),
            height: 0.4,
            thickness: 0.7,
          ),
        ],
      ),
    );
  }
}
