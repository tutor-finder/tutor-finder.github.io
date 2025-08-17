import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutor_finder_app/src/config/routes.dart';
import 'package:tutor_finder_app/src/features/auth/providers/auth_provider.dart';

class ASignUpScreen extends StatefulWidget {
  const ASignUpScreen({super.key});

  @override
  State<ASignUpScreen> createState() => _ASignUpScreenState();
}

class _ASignUpScreenState extends State<ASignUpScreen> {
  // Define and initialize all TextEditingController instances
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // State variables for password visibility and loading state
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    // Dispose all controllers to prevent memory leaks
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // Asynchronous function to handle the sign-up logic
  Future<void> _handleSignUp() async {
    final AAuthProvider authProvider = Provider.of<AAuthProvider>(
      context,
      listen: false,
    );

    // Simple validation check
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Passwords do not match.')));
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await authProvider.signUpWithEmailAndPassword(
        lastName: _lastNameController.text.trim(),
        firstName: _firstNameController.text.trim(),
        username: _usernameController.text.trim(),
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
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 56.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  TextFormField(
                    controller: _firstNameController,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  // Last Name field
                  TextFormField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  // Username field
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  // Email field
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16.0),

                  // Password field
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      suffixIcon: GestureDetector(
                        onTapDown:
                            (_) => setState(() => _isPasswordVisible = true),
                        onTapUp:
                            (_) => setState(() => _isPasswordVisible = false),
                        child: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  // Confirm Password field
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: !_isConfirmPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: const OutlineInputBorder(),
                      suffixIcon: GestureDetector(
                        onTapDown:
                            (_) => setState(
                              () => _isConfirmPasswordVisible = true,
                            ),
                        onTapUp:
                            (_) => setState(
                              () => _isConfirmPasswordVisible = false,
                            ),
                        child: Icon(
                          _isConfirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32.0),

                  // Sign Up Button with loading indicator
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _handleSignUp,
                          child:
                              _isLoading
                                  ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                  : const Text('Sign Up'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  // Row with "Forgot Password" and "Sign In" buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text('Forgot Password?'),
                      ),
                      TextButton(
                        onPressed:
                            () => Navigator.pushNamed(
                              context,
                              ARoutes.aSignInRoute,
                            ),
                        child: const Text('Sign In'),
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
