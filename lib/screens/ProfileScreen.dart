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
        padding: const EdgeInsets.all(10.0),
        itemCount: profileSettinglist.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.all(5.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            child: ListTile(
              leading: Icon(profileSettinglist[index].icons, color: Colors.black,),
              title: Text(profileSettinglist[index].name,style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0)),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black,),
              contentPadding: const EdgeInsets.all(10.0),
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
