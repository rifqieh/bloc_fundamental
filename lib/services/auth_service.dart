import 'dart:async';

class AuthService {
  loginByEmailPassword(String email, String password) {
    return Future.delayed(Duration(seconds: 2), () {
      throw 'gagal login karena password salah';

      // return {
      //   'token': 'qwerty123',
      // };
    });
  }

  loginByGoogle() {
    return {
      'token': 'google123',
    };
  }

  loginByFacebook() {
    return {
      'token': 'facebook123',
    };
  }
}
