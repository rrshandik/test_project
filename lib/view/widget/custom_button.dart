import 'package:flutter/material.dart';
import 'package:flutter_suit_question1_dika/view/widget/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.width = 200
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.red,
        ),
        child: Text(
          text,
          style: TextStyles.title.copyWith(fontSize: 15, color: Colors.white),
        ),
        
      ),
    );
  }
}
