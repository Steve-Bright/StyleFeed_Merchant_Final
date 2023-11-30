import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  bool valNotify1 = true;
  bool valNotify2 = false;
  bool valNotify3 = false;

  onChangeFunction1(bool newValue1){
    setState(() {
      valNotify1 = newValue1; 
    });
  }

  onChangeFunction2(bool newValue2){
    setState(() {
      valNotify2 = newValue2; 
    });
  }

  onChangeFunction3(bool newValue3){
    setState(() {
      valNotify3 = newValue3; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF31496B),
        title: Text("Setting", style: TextStyle(fontSize: 22, color: Colors.white,), ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Color(0xFF31496B),
                ),
                SizedBox(width: 10,),
                Text("Account", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],
            ),
            Divider(height: 20, thickness: 1,),
            SizedBox(height: 10,),
            buildAccountOption(context, "Change Password"),
            buildAccountOption(context, "Content Settings"),
            buildAccountOption(context, "Social"),
            buildAccountOption(context, "Language"),
            buildAccountOption(context, "Pravicy and Security"),
            SizedBox(height: 40,),
            Row(
              children: [
                Icon(Icons.volume_up_outlined,color: Color(0xFF31496B),),
                SizedBox(width: 10,),
                Text("Notification", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],
            ),
            Divider(height: 20, thickness: 1,),
            SizedBox(height: 10,),
            buildNotificationOption("Theme Dark", valNotify1, onChangeFunction1),
            buildNotificationOption("Account Active", valNotify2, onChangeFunction2),
            buildNotificationOption("Opportunity", valNotify3, onChangeFunction3),
            SizedBox(height: 50,),
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
                onPressed: (){},
                child: Text("SIGN OUT", style:  TextStyle(
                  fontSize: 16,
                  letterSpacing: 2.2,
                  color: Colors.black
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }


  Padding buildNotificationOption(String title, bool value, Function onChangedMethod){
     return Padding(padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
     child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.grey[600]
        ),),
        Transform.scale(
  scale: 0.7,
  child: CupertinoSwitch(
    activeColor: Color(0xFF31496B),
    trackColor: Colors.grey,
    value: value,
    onChanged: (bool newValue) {
      onChangedMethod(newValue);
    },
  ),
)

      ],
     ),
     );
  }
  GestureDetector buildAccountOption(BuildContext context, String title){
    return GestureDetector(
      onTap:(){
        showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Option 1"),
              Text("Option 2"),
            ],
          ),
          actions: [
            TextButton(onPressed: (){
            Navigator.of(context).pop();
            },
             child: Text("Close"))
          ],
        );
        });
      },
      child: Padding(padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600]
          ),),
          Icon(Icons.arrow_forward_ios, color: Colors.grey)
        ],
      ),
      ),
    );
  }
}