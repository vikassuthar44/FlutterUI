import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class ProfileSetting {
  late String name;
  late IconData icons;

  ProfileSetting(this.name, this.icons);
}

class _ProfileScreenState extends State<ProfileScreen> {
  late List<ProfileSetting> profileSettinglist;

  @override
  void initState() {
    super.initState();
    profileSettinglist = [
      ProfileSetting("My Profile", Icons.person),
      ProfileSetting("Setting", Icons.settings),
      ProfileSetting("Notifications", Icons.notifications),
      ProfileSetting("Transaction History", Icons.event_note),
      ProfileSetting("FAQ", Icons.help),
      ProfileSetting("About App", Icons.help),
      ProfileSetting("Logout", Icons.logout),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        title: const Text(
          "Profile",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),
      body: Container(
        color: Colors.white70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            profileView(),
            const SizedBox(height: 10.0,),
            profileSettingList()
          ],
        ),
      ),
    );
  }

  Widget profileSettingList() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        itemCount: profileSettinglist.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.white
                ),
            child: Row(
              children: [
                Icon(profileSettinglist[index].icons),
                const SizedBox(
                  width: 20.0,
                ),
                Text(
                  profileSettinglist[index].name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                )
              ],
            ),
          );
        });
  }

  Widget profileView() {
    return Row(
      children: [
        const SizedBox(width: 27.0),
        Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            image: const DecorationImage(
              image: NetworkImage(
                  "https://avatars.githubusercontent.com/u/18672346?v=4"),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
            border: Border.all(
              color: Colors.black54,
              width: 2.0,
            ),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Vikas Suthar",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
            SizedBox(height: 5.0),
            Text(
              "username: androiddev_vikas",
              style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.0),
            )
          ],
        )
      ],
    );
  }
}
