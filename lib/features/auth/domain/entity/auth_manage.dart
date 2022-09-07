enum Auth { signup, signin }

enum UserType { user, admin }

class AuthManage {
  Auth auth;
  UserType userType;
  bool isObscure;
  AuthManage({this.auth = Auth.signin, this.userType = UserType.user,this.isObscure =true});

}
