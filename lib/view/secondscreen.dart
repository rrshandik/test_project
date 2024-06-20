import 'package:flutter/material.dart';
import 'package:flutter_suit_question1_dika/view/widget/custom_button.dart';
import 'package:flutter_suit_question1_dika/view/widget/styles.dart';
import 'package:flutter_suit_question1_dika/view/thirdscreen.dart';

class second_screen extends StatefulWidget {
  final String name;
  const second_screen({super.key, required this.name});

  @override
  State<second_screen> createState() => _second_screenState();
}

class _second_screenState extends State<second_screen> {
  String selectedUser = '';

  void onPressed() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => third_screen()),
    );

    if (result != null) {
      setState(() {
        selectedUser = result;
      });
    }
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Welcome,', 
              style: TextStyles.body.copyWith(
                color: Colors.black, fontSize: 14)
            ),
  
            Text("${widget.name}",
              style: TextStyles.title.copyWith(
                fontWeight: FontWeight.bold, 
                color: Colors.black, 
                fontSize: 26),
            ),
            
            Spacer(),
            Center(child: Text(
              selectedUser.isEmpty ? 
              'Selected User' : selectedUser, 
              style: TextStyles.title.copyWith(
                color: Colors.black,
                fontSize: 30))
                ,
              ),

            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(text: 'Choose a User', onPressed: onPressed)
            )
          ],
          
        ),
      ),
    );
  }
}
