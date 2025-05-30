import 'package:google_sign_in/google_sign_in.dart';
import 'package:mma_flutter/user/enumtype/login_platform.dart';
import 'package:mma_flutter/user/model/naver_login_request.dart';

class GoogleLoginService {
  static Future<SocialLoginRequest> login() async {
    print('domain = ${ LoginPlatform.google.name.toUpperCase()}');
    final GoogleSignInAccount? user = await GoogleSignIn().signIn();
    if (user != null) {
      final GoogleSignInAuthentication googleAuth = await user.authentication;
      return SocialLoginRequest(
        domain: LoginPlatform.google.name.toUpperCase(),
        accessToken: googleAuth.accessToken!,
        email: user.email,
        socialId: user.id,
      );
    }else{
      throw Exception("구글 로그인 에러!");
    }
  }
}
