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

  bool _isPalindrome(String str) {
    String cleanedString = str.replaceAll(RegExp(r'[\W_]+'), '').toLowerCase();
    String reversedString = cleanedString.split('').reversed.join('');
    return cleanedString == reversedString;
  }

  void _checkPalindrome() {
    String enteredSentence = _sentenceController.text;
    bool isPalindrome = _isPalindrome(enteredSentence);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isPalindrome ? "isPalindrome" : "not Palindrome"),
          content: Text(isPalindrome ? "You can log in" : "You can't log in"),
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

  void _nextScreen() {
    String enteredSentence = _sentenceController.text;
    bool isPalindrome = _isPalindrome(enteredSentence);

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
        title: Text(
          'First Screen',
          style: TextStyles.title,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              child: Image.asset(
                'assets/images/user.png',
                fit: BoxFit.contain,
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 30.0),
            TextField(
              controller: _nameController,
              style: TextStyles.body.copyWith(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Name',
                hintStyle: TextStyles.light.copyWith(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0.5,
                    color: AppColors.red,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _sentenceController,
              style: TextStyles.body.copyWith(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Palindrome',
                hintStyle: TextStyles.light.copyWith(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0.5,
                    color: AppColors.red,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            CustomButton(text: 'Check', onPressed: _checkPalindrome),
            SizedBox(height: 16),
            CustomButton(text: 'Next', onPressed: _nextScreen)
          ],
        ),
      ),
    );
  }
}
