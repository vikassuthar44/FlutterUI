import 'package:flutter/material.dart';

class WhatsAppUIScreen extends StatefulWidget {
  @override
  _WhatsAppUIScreenState createState() => _WhatsAppUIScreenState();
}

class StoryData {
  late String name;
  late AssetImage profileIcon;

  StoryData(this.name, this.profileIcon);
}

class _WhatsAppUIScreenState extends State<WhatsAppUIScreen> {
  late List<StoryData> storyListData;

  @override
  initState() {
    super.initState();
    storyListData = <StoryData>[
      StoryData("Vikas", const AssetImage("images/google.png")),
      StoryData("Vikas", const AssetImage("images/google.png")),
      StoryData("Vikas", const AssetImage("images/google.png")),
      StoryData("Vikas", const AssetImage("images/google.png")),
      StoryData("Vikas", const AssetImage("images/google.png")),
      StoryData("Vikas", const AssetImage("images/google.png"))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: const Icon(
          Icons.menu,
          color: Colors.black87,
        ),
        elevation: 0,
        title: const Text(
          "Whatsapp Chat",
          style: TextStyle(
              fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
             children: [
               /*Container(
                 width: 60.0,
                 height: 60.0,
                 decoration: BoxDecoration(
                   color: const Color(0xff7c94b6),
                   image: DecorationImage(
                       image: AssetImage("images/rainy.png"),
                       fit: BoxFit.cover
                   ),
                   borderRadius: const BorderRadius.all( Radius.circular(50.0)),
                   border: Border.all(
                     color: Colors.red,
                     width: 3.0,
                   ),
                 ),
               )*/
               Expanded(
                   child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                       shrinkWrap: true,
                       itemCount: storyListData.length + 1,
                       itemBuilder: (context, index) {
                         return storyList(storyListData[index]);
                       })
               )
             ],
            )
          ],
        )),
      ),
    );
  }

  Widget storyList(StoryData storyData) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: DecorationImage(
                    image: storyData.profileIcon,
                    fit: BoxFit.cover
                  ),
                  borderRadius: const BorderRadius.all( Radius.circular(50.0)),
                  border: Border.all(
                    color: Colors.red,
                    width: 3.0,
                  ),
                ),
              ),
              const SizedBox(height: 5.0,),
              const Text("Vikas")
            ],
          )
        ],
      ),
    );
  }
}
