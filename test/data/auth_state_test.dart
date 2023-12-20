import 'package:flutter_test/flutter_test.dart';
import 'package:test_flutter_onebox/presentation/state/auth_state.dart';


void main() {
  group('AuthState', () {
    late AuthState authState;

    setUp(() {
      authState = AuthState();
    });

    test('updateUsername should update username and validate it', () {
      authState.updateUsername('user');
      expect(authState.username, 'user');
      expect(authState.validateUsername(), true);
    });

    test('updatePassword should update password and validate it', () {
      authState.updatePassword('pass');
      expect(authState.password, 'pass');
      expect(authState.validatePassword(), true);
    });
  });
}
