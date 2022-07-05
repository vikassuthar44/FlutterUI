import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  DrawerScreenState createState() => DrawerScreenState();
}

class DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer Screen"),
      ),
      body: const Center(
        child: Text("Body Part"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            DrawerHeader(child: Row(
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
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
                  width: 15.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                     Text("Vikas Suthar",
                        style: TextStyle(
                          color: Colors.deepOrangeAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                    Text("52 Events",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15.0)),
                  ],
                )

              ],
            )),
            menuItem("Home", Icons.home, true),
            menuItem("Explore", Icons.search,false),
            menuItem("My Events", Icons.event,false),
            menuItem("Tasks", Icons.task,false),
            menuItem("Invite Friends", Icons.inventory,false),
            menuItem("Settings", Icons.settings,false),
            menuItem("About", Icons.info,false),
            const SizedBox(height: 100.0),
            menuItem("Log Out", Icons.logout,false),

          ],
        ),
      ),
    );
  }

  Widget menuItem(String title, IconData iconData, bool isSelected) {
    return ListTile(
      selected: isSelected,
      selectedColor: Colors.deepOrangeAccent,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
      leading: Icon(iconData),
      onTap: (){
        Navigator.of(context).pop();
        final snackBar = SnackBar(
            content: Text("Press On $title"),
          action: SnackBarAction(
            label: "Undo",
            onPressed: () {

            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
