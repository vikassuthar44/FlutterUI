import 'package:flutter/material.dart';

class WhatsAppProfileScreen extends StatefulWidget {
  const WhatsAppProfileScreen({Key? key}) : super(key: key);

  @override
  _WhatsAppProfileState createState() => _WhatsAppProfileState();
}

class _WhatsAppProfileState extends State<WhatsAppProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.arrow_back_ios,
              color: Colors.blueAccent,
            ),
            //Text("Back", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),)
          ],
        ),
        title: const Text(
          "Contact Info",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22.0),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey.shade200,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              profileView(),
              const SizedBox(
                height: 20.0,
              ),
              callView(),
              const SizedBox(height: 10.0,),
              aboutView(),
              const SizedBox(height: 10.0,),
              mediaView(),
              const SizedBox(height: 10.0,),
              controlView(),
              const SizedBox(height: 10.0,),
              privacyView(),
              const SizedBox(height: 10.0,),
              contactDetailsview(),
              const SizedBox(height: 10.0,),
              shareView(),
              const SizedBox(height: 10.0,),
              reportView()
            ],
          ),
        ),
      ),
    );
  }

  profileView() {
    return Column(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: const BoxDecoration(
            color: Color(0xff7c94b6),
            image: DecorationImage(
              image: NetworkImage(
                  "https://avatars.githubusercontent.com/u/18672346?v=4"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(75.0)),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Text("Vikas Suthar", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25.0)),
        const SizedBox(
          height: 5.0,
        ),
        const Text("+91 9876543210", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 16.0))
      ],
    );
  }
  
  callView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          singleCallView("Audio", Icons.call),
          singleCallView("Video", Icons.video_call),
          singleCallView("Search", Icons.search),
          singleCallView("Pay", Icons.currency_rupee),
        ],
      ),
    );
  }

  singleCallView(String title, IconData icons) {
    return Container(
      width: 80,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      child: Column(
        children: [
          Icon(icons, color: Colors.blueAccent,),
          const SizedBox(height: 5.0),
          Text(title, style: const TextStyle(color: Colors.blueAccent),)
        ],
      ),
    );
  }

  aboutView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("In a Meeting. Talk me later", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0)),
          SizedBox(height: 5.0),
          Text("21 December, 2021", style: TextStyle(color: Colors.black),)
        ],
      ),
    );
  }

  mediaView() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      child: Column(
        children: [
          singleMediaView("Media, Links and Docs", "23", Icons.perm_media_outlined, Colors.blueAccent,""),
          const Divider(),
          singleMediaView("Starred Messages", "53", Icons.star, Colors.yellow,""),
        ],
      ),
    );
  }

  singleMediaView(String title, String count, IconData iconData, Color bgColor, String subTitle) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      subtitle: subTitle.isNotEmpty ? Text(subTitle, style: const TextStyle(color: Colors.black54, fontSize: 12.0),): null,
      leading: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: bgColor,borderRadius: const BorderRadius.all(Radius.circular(10.0))
        ),
        child: Icon(iconData, color: Colors.white,),
      ),
      trailing: SizedBox(
        width: 70.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(count),
            const SizedBox(width: 5.0),
            const Icon(
              Icons.arrow_forward_ios,
              size: 15.0,
            )
          ],
        ),
      ),
    );
  }

  controlView() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
    decoration: const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(10.0))
    ),
    child: Column(
    children: [
    singleMediaView("Mute", "No", Icons.volume_up, Colors.green,""),
    const Divider(),
    singleMediaView("Wallpaper and Sound", "", Icons.wallpaper, Colors.pink,""),
    const Divider(),
    singleMediaView("Save to Camera Roll", "Default", Icons.file_download_outlined, Colors.yellow,"")
    ],
    ),
    );
  }

  privacyView() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      child: Column(
        children: [
          singleMediaView("Disappearing Messages", "Off", Icons.privacy_tip, Colors.blue,""),
          const Divider(),
          singleMediaView("Encryption", "", Icons.lock, Colors.blue,"Messages and calls are end-to-end encrypted. Tap to verify."),
        ],
      ),
    );
  }

  contactDetailsview() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      child: Column(
        children: [
          singleMediaView("Contact Details", "", Icons.person, Colors.grey,""),
        ],
      ),
    );
  }

  shareView() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          singleShareView("Share Contact", Colors.blue),
          const Divider(),
          singleShareView("Export Chat", Colors.blue),
          const Divider(),
          singleShareView("Clear Chat", Colors.red)
        ],
      ),
    );
  }

  singleShareView(String title, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style:  TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 16.0),),
        ],
      ),
    );
  }

  reportView() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          singleShareView("Block Vikas Suthar", Colors.red),
          const Divider(),
          singleShareView("Report Vikas suthar", Colors.red),
        ],
      ),
    );
  }
}
