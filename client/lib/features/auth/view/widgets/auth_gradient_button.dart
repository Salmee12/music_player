
import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';

class AuthGradientButton extends StatelessWidget {
  const AuthGradientButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        gradient: const LinearGradient(colors: [
          Pallete.gradient2,Pallete.gradient1
        ],),
          borderRadius: BorderRadius.circular(8)
    ),
      child: ElevatedButton(onPressed:(){},
          style:ElevatedButton.styleFrom(
            fixedSize: const Size(300, 55),
            backgroundColor:Pallete.transparentColor,
            shadowColor: Pallete.transparentColor,
          ),
               child: Text("Sign up")
      ),
    );
  }
}