import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter_onebox/presentation/state/auth_state.dart';

class PasswordVisibilityToggle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<AuthState>(context);

    return IconButton(
      icon: Icon(
        authState.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
      ),
      onPressed: () {
        authState.togglePasswordVisibility();
      },
    );
  }
}
