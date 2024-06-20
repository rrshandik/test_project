import 'package:flutter/material.dart';
import 'package:flutter_suit_question1_dika/view/widget/custom_button.dart';
import 'package:flutter_suit_question1_dika/view/widget/styles.dart';
import 'package:flutter_suit_question1_dika/view/secondscreen.dart';

class first_screen extends StatefulWidget {
  const first_screen({super.key});

  @override
  State<first_screen> createState() => _first_screenState();
}

class _first_screenState extends State<first_screen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sentenceController = TextEditingController();

  final List<Map<String, String>> _validCredentials = [
    {"palindrome": "suitmedia"},
    {"palindrome": "ramadika"},
    {"palindrome": "mobile"},
  ];

  void _checkPalindrome() {
    String enteredSentence = _sentenceController.text;
    bool isPalindrome = _validCredentials.any((credential) =>
        credential["palindrome"] == enteredSentence.toLowerCase());

    if (isPalindrome) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("isPalindrome"),
            content: Text("You can log in"),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("not Palindrome"),
            content: Text("You can't log in"),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void _nextscreen() {
    String enteredSentence = _sentenceController.text;
    bool isPalindrome = _validCredentials.any((credential) =>
        credential["palindrome"] == enteredSentence.toLowerCase());

    if (isPalindrome) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => second_screen(
            name: _nameController.text,
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Login Failed"),
            content: Text("Palindrome is incorrect!"),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen',
        style: TextStyles.title,),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnimatedContainer(
                duration: Duration(seconds: 1), // Durasi animasi
                child: Image.asset(
                  'assets/images/user.png',
                  fit: BoxFit.contain,
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(height: 30.0),
              // Spacer(),
            
            TextField(
              controller: _nameController,
              style: TextStyles.body.copyWith(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Name', hintStyle: TextStyles.light.copyWith(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0.5,
                    color: AppColors.red,
                  ),
                  borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _sentenceController,
              style: TextStyles.body.copyWith(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Palindrome', hintStyle: TextStyles.light.copyWith( color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0.5,
                    color: AppColors.red,
                  ),
                  borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
            SizedBox(height: 16),
            CustomButton(text: 'Check', onPressed: _checkPalindrome),
            SizedBox(height: 16),
            CustomButton(text: 'Next', onPressed: _nextscreen)

           
          ],
        ),
      ),
    );
  }
}
