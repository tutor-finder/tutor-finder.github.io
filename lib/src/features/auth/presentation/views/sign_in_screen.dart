import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutor_finder_app/src/config/routes.dart';
import 'package:tutor_finder_app/src/features/auth/providers/auth_provider.dart';

class ASignInScreen extends StatefulWidget {
  const ASignInScreen({super.key});

  @override
  State<ASignInScreen> createState() => _ASignInScreenState();
}

class _ASignInScreenState extends State<ASignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future<void> _handleSignIn() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final AAuthProvider authProvider = Provider.of<AAuthProvider>(
        context,
        listen: false,
      );

      await authProvider.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (mounted) {
        Navigator.of(context).pushNamed(ARoutes.aHomeRoute);
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(error.toString())));
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Expanded(flex: 4, child: SizedBox()),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: GestureDetector(
                        onTapDown: (_) {
                          setState(() {
                            _isPasswordVisible = true;
                          });
                        },
                        onTapUp: (_) {
                          setState(() {
                            _isPasswordVisible = false;
                          });
                        },
                        onLongPress: () {
                          setState(() {
                            _isPasswordVisible = true;
                          });
                        },
                        onLongPressUp: () {
                          setState(() {
                            _isPasswordVisible = false;
                          });
                        },
                        child: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _handleSignIn,
                          child:
                              _isLoading
                                  ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                  : const Text('Sign In'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Forgot Password?'),
                      ),
                      ElevatedButton(
                        onPressed:
                            () => Navigator.pushNamed(
                              context,
                              ARoutes.aSignUpRoute,
                            ),
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Expanded(flex: 4, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
