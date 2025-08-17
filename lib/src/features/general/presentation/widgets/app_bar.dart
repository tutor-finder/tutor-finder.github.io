import 'package:flutter/material.dart';
import 'package:tutor_finder_app/src/config/routes.dart';

class AAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isSignIn;
  final bool isSignUp;
  final bool isSearch;

  const AAppBar({
    super.key,
    this.isSearch = false,
    this.isSignIn = false,
    this.isSignUp = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.only(
        left: 4.0,
        top: 4.0,
        right: 4.0,
        bottom: 2.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          if (isSearch)
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  focusedErrorBorder: OutlineInputBorder(),
                  disabledBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                  hintText: 'Search...',
                ),
              ),
            ),
          Row(
            children: <Widget>[
              if (isSignUp)
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ARoutes.aSignUpRoute);
                  },
                  child: const Text('Sign Up'),
                ),
              if (isSignUp && isSignIn) const SizedBox(width: 8.0),
              if (isSignIn)
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ARoutes.aSignInRoute);
                  },
                  child: const Text('Sign In'),
                ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2.0);
}
