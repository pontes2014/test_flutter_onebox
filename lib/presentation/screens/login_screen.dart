import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter_onebox/presentation/screens/info_capture_screen.dart';
import 'package:test_flutter_onebox/presentation/state/auth_state.dart';
import 'package:test_flutter_onebox/presentation/widgets/password_visibility_toggle.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<AuthState>(context);

    return Scaffold(
      backgroundColor: Colors.orange,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/logo.svg',
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 40),
            TextField(
              onChanged: (value) => authState.updateUsername(value),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'Login',
                prefixIcon: const Icon(Icons.person),
                errorText: (authState.usernameError != null)
                    ? authState.usernameError
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              onChanged: (value) => authState.updatePassword(value),
              obscureText: !authState.isPasswordVisible,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'Senha',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: PasswordVisibilityToggle(),
                errorText: (authState.passwordError != null)
                    ? authState.passwordError
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (authState.validateLogin() && authState.validatePassword()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InfoCaptureScreen()),
                  );
                }
              },
              child: const SizedBox(
                  width: 90,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
