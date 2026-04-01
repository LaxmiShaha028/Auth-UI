import 'package:flutter/material.dart';

void main() {
  runApp(const AuthApp());
}

class AuthApp extends StatelessWidget {
  const AuthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF9C27B0),
        fontFamily: 'Inter',
      ),
      home: const AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool isLogin = true;

  void toggleView() {
    setState(() => isLogin = !isLogin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFFDE7), Color(0xFFFCE4EC), Color(0xFFF3E5F5)],
          ),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: isLogin
              ? LoginScreen(onSignUp: toggleView, key: const ValueKey('login'))
              : SignupScreen(onLogin: toggleView, key: const ValueKey('signup')),
        ),
      ),
    );
  }
}

// --- Common Components ---

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.icon,
    required this.hint,
    this.isPassword = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFEDE7F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey[400], size: 20),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined ? Colors.transparent : const Color(0xFF9C27B0),
          side: isOutlined ? const BorderSide(color: Color(0x4D9C27B0), width: 2) : null,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: isOutlined ? 0 : 4,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isOutlined ? const Color(0xFF9C27B0) : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

// --- Screens ---

class LoginScreen extends StatelessWidget {
  final VoidCallback onSignUp;
  const LoginScreen({super.key, required this.onSignUp});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Welcome Back", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
            const SizedBox(height: 8),
            const Text("Enter your credential to login", style: TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 40),
            const CustomTextField(icon: Icons.person_outline, hint: "Username"),
            const CustomTextField(icon: Icons.lock_outline, hint: "Password", isPassword: true),
            const SizedBox(height: 12),
            PrimaryButton(text: "Login", onPressed: () {}),
            const SizedBox(height: 32),
            TextButton(
              onPressed: () {},
              child: const Text("Forgot password?", style: TextStyle(color: Color(0xFF9C27B0), fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Dont have an account? ", style: TextStyle(color: Colors.grey)),
                GestureDetector(
                  onTap: onSignUp,
                  child: const Text("Sign Up", style: TextStyle(color: Color(0xFF9C27B0), fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SignupScreen extends StatelessWidget {
  final VoidCallback onLogin;
  const SignupScreen({super.key, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Sign up", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
            const SizedBox(height: 8),
            const Text("Create your account", style: TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 32),
            const CustomTextField(icon: Icons.person_outline, hint: "Username"),
            const CustomTextField(icon: Icons.mail_outline, hint: "Email"),
            const CustomTextField(icon: Icons.lock_outline, hint: "Password", isPassword: true),
            const CustomTextField(icon: Icons.lock_outline, hint: "Confirm Password", isPassword: true),
            const SizedBox(height: 12),
            PrimaryButton(text: "Sign up", onPressed: () {}),
            const SizedBox(height: 20),
            const Text("Or", style: TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 20),
            PrimaryButton(text: "Sign In with Google", onPressed: () {}, isOutlined: true),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? ", style: TextStyle(color: Colors.grey)),
                GestureDetector(
                  onTap: onLogin,
                  child: const Text("Login", style: TextStyle(color: Color(0xFF9C27B0), fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}