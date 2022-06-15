import 'package:flutter/material.dart';

class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class StoryList {
  late String name;
  late String profilePic;
  late Color bgColor;
  late String lastMsg;

  StoryList(this.name, this.profilePic, this.bgColor,this.lastMsg);
}

class _ChatListScreenState extends State<ChatListScreen> {
  late List<StoryList> storyLists;
  final Color _accentColor = const Color(0xFF164CA2);

  @override
  void initState() {
    super.initState();
    storyLists = [
      StoryList("Vikas Suthar", "https://cdn.iconscout.com/icon/free/png-256/face-1659511-1410033.png", Colors.amber, "This is last message from Vikas Suthar. Tap to reply"),
      StoryList("Deepika Padukon", "https://cdn.iconscout.com/icon/free/png-128/face-1659512-1410034.png", Colors.amber, "This is last message from Deepika Padukon.Tap to reply"),
      StoryList("Dev Anand", "https://cdn.iconscout.com/icon/free/png-128/asian-1659529-1410051.png", Colors.amber, "This is last message from Dev Anand. Tap to reply"),
      StoryList("Katrina Kaif", "https://cdn.iconscout.com/icon/free/png-128/air-hostess-1659534-1410056.png", Colors.amber, "This is last message from Katrina Kaif. Tap to reply"),
      StoryList("Salman khan", "https://cdn.iconscout.com/icon/free/png-128/avatar-1659528-1410050.png", Colors.amber, "This is last message from Salman khan. Tap to reply"),
      StoryList("Dev Anand", "https://cdn.iconscout.com/icon/free/png-128/boy-1659526-1410048.png", Colors.amber, "This is last message from Dev Anand. Tap to reply"),
      StoryList("Vikky Trivedi", "https://cdn.iconscout.com/icon/free/png-128/business-1659524-1410046.png", Colors.amber, "This is last message from Vikky Trivedi. Tap to reply"),
      StoryList("Bhavesh Jain", "https://cdn.iconscout.com/icon/free/png-128/avatar-1659503-1410025.png", Colors.amber, "This is last message from Bhavesh Jain. Tap to reply"),

    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        elevation: 0,
        backgroundColor: Colors.blue,
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 20.0,)
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Chat with \nyour friends",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  fontFamily: 'Raleway'),
            ),
          ),
          Container(
            height: 100,
            padding: EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Container(
                  child: addStorywidget(),
                ),
                Container(
                    child: storyList()
                ),
              ],
            ),
          ),
          Container(
            height: 537,
            decoration: const BoxDecoration(
                color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)
              )
            ),
            child: profileChatList(),
          )
        ],
      ),
    );
  }

  Widget profileChatList() {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 10.0);
        },
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: storyLists.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int index) {
           return ListTile(
             contentPadding: const EdgeInsets.all(5.0),
             title: Text(storyLists[index].name, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
             subtitle: Text(storyLists[index].lastMsg, style: const TextStyle(fontSize: 12.0),),
             leading:  Container(
               width: 50.0,
               height: 50.0,
               decoration: BoxDecoration(
                 color: storyLists[index].bgColor,
                 image:  DecorationImage(
                   image: NetworkImage(
                       storyLists[index].profilePic),
                   fit: BoxFit.cover,
                 ),
                 borderRadius: const BorderRadius.all(Radius.circular(50.0)),
               ),
             ),
           );
        }
    );
  }

  Widget addStorywidget() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: const DecorationImage(
                image: NetworkImage(
                    "https://cdn.iconscout.com/icon/free/png-128/add-new-create-plus-insert-append-interface-2503.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              border: Border.all(
                color: Colors.orange,
                width: 2.0,
              ),
            ),
          ),
          const SizedBox(height: 10.0,),
          const SizedBox(
            width: 60.0,
            child: Text(
              "Add",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }
  Widget storyList() {
    return Expanded(
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: storyLists.length,
          padding: const EdgeInsets.only(left: 10.0),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: DecorationImage(
                      image: NetworkImage(
                          storyLists[index].profilePic),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                    border: Border.all(
                      color: Colors.orange,
                      width: 2.0,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0,),
                SizedBox(
                  width: 60.0,
                  child: Text(
                    textAlign: TextAlign.center,
                    storyLists[index].name,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                )
              ],
            );
          }, separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 20.0);
      },),
    );
  }
}
