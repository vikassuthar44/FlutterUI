import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  final Color _accentColor = const Color(0xFF164CA2);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       leading: const Icon(Icons.arrow_back_ios),
       elevation: 0,
       backgroundColor: _accentColor.withOpacity(0.5),
     ),
     body: Stack(
       fit: StackFit.expand,
       children: [
         Container(
           width: double.infinity,
           height: double.infinity,
           decoration: BoxDecoration(
               gradient: LinearGradient(
                   begin: FractionalOffset.topCenter,
                   end: FractionalOffset.bottomCenter,
                   colors: [
                     _accentColor.withOpacity(0.5),
                     _accentColor
                   ],
                   stops: const [
                     0.0,
                     1.0
                   ]
               )
           ),
         ),
         Align(
           alignment: const Alignment(0,-0.1),
           child: Column(
             children: [
               const SizedBox(height: 50.0,),
               const SizedBox(
                 height: 150,
                 width: 150,
                 child: Icon(
                   Icons.verified_user,
                   size: 150,
                   color: Colors.white,
                 ),
               ),
               const SizedBox(height: 30.0,),
               const Text("Verification", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0, fontFamily: 'Raleway'),),
               const SizedBox(height: 10.0,),
               const Text("We have sent OTP on your number \n+91XXXXXXXXXX",
                 textAlign: TextAlign.center,
                 style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 12.0, fontFamily: 'Raleway'),),

               const SizedBox(height: 20.0,),
               const Text("Enter your OTP code number", style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15.0, fontFamily: 'Raleway'),),
               const SizedBox(height: 20.0,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   OtpBox(),
                   OtpBox(),
                   OtpBox(),
                   OtpBox(),
                 ],
               ),
               const SizedBox(height: 30.0,),
               SizedBox(
                 width: 325,
                 height: 50,
                 child:  MaterialButton(
                   elevation: 5.0,
                   onPressed: (){},
                   color: Colors.orange,
                   shape: const RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(Radius.circular(20.0))
                   ),
                   child: const Text("Verify", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
                 ),
               ),
               const SizedBox(height: 50.0,),
               const Text("Didn't you receive any code?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15.0, fontFamily: 'Raleway'),),
               const SizedBox(height: 10.0,),
               const Text("Resend New Code", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 20.0, fontFamily: 'Raleway'),),

             ],
           ),
         )
       ],
     ),
   );
  }

  Widget OtpBox() {
    return Container(
      height: 50,
      width: 50,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white
      ),
    );
  }

}