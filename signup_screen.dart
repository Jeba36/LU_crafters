import 'package:app1/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 200.0,
                height: 80.0,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 10),
              const Text(
                'Join the crafting community-Discover, create and shop',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    _buildTextField(
                      label: 'Enter your Name',
                      icon: Icons.person,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter your name'
                          : null,
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      label: 'Enter your Email',
                      icon: Icons.email,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter your email'
                          : null,
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      label: 'Enter your Number',
                      icon: Icons.phone,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter your number'
                          : null,
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      label: 'Student ID',
                      icon: Icons.person,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter your student ID'
                          : null,
                    ),
                    const SizedBox(height: 20),
                    _buildPasswordField(
                      label: 'Password',
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter your password'
                          : null,
                      icon: Icons.lock,
                    ),
                    const SizedBox(height: 20),
                    _buildPasswordField(
                      label: 'Confirm Password',
                      icon:Icons.lock_outline,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please confirm your password'
                          : null,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(17, 45, 78, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Handle sign up logic here
                      }
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Already have an account? Log In',
                  style: TextStyle(
              
                    color: Colors.blue,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.lightBlueAccent.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
      ),
      validator: validator,
    );
  }

  Widget _buildPasswordField({
    required String label,
    String? Function(String?)? validator,
    required IconData icon,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.lightBlueAccent.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
      ),
      obscureText: _obscurePassword,
      validator: validator,
    );
  }
}
