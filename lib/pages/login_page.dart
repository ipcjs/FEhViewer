import 'package:FEhViewer/client/eh_login.dart';
import 'package:FEhViewer/common/global.dart';
import 'package:FEhViewer/generated/l10n.dart';
import 'package:FEhViewer/models/states/user_model.dart';
import 'package:FEhViewer/models/user.dart';
import 'package:FEhViewer/route/navigator_util.dart';
import 'package:FEhViewer/utils/toast.dart';
import 'package:FEhViewer/values/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  FocusNode _nodePwd = FocusNode();

  //账号的控制器
  TextEditingController _usernameController = TextEditingController();

  //密码的控制器
  TextEditingController _passwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var ln = S.of(context);
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(ln.user_login),
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.fromLTRB(50, 40, 50, 20),
            child: Column(
              children: <Widget>[
                Container(
                  height: 38,
                  child: CupertinoTextField(
                    controller: _usernameController,
                    placeholder: ln.pls_i_username,
                    prefix: ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 50),
                        child: Text(ln.user_name)),
                    // prefixMode: OverlayVisibilityMode.never,
                    decoration: null,
                    // autofocus 自动获得焦点
//                    autofocus: true,
                    onEditingComplete: () {
                      // 点击键盘完成 焦点跳转密码输入框
                      FocusScope.of(context).requestFocus(_nodePwd);
                    },
                  ),
                ),
                Container(
                  height: 1,
                  color: CupertinoColors.systemGrey4,
                ),
                Container(
                  height: 48,
                  padding: const EdgeInsets.only(top: 10, bottom: 0),
                  child: CupertinoTextField(
                    controller: _passwdController,
                    placeholder: ln.pls_i_passwd,
                    prefix: ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 50),
                        child: Text(ln.passwd)),
                    // prefixMode: OverlayVisibilityMode.never,
                    decoration: null,
                    obscureText: true,
                    focusNode: _nodePwd,
                  ),
                ),
                Container(
                  height: 1,
                  color: CupertinoColors.systemGrey4,
                ),
                CupertinoButton(
                  child: Text(ln.login),
//                  color: CupertinoColors.activeBlue,
                  onPressed: () {
                    _login();
                  },
                ),
                CupertinoButton(
                  child: Text(ln.login_web),
                  onPressed: () {
                    NavigatorUtil.goWebLogin(
                        context, ln.login_web, EHConst.URL_SIGN_IN);
                  },
                )
              ],
            ),
          ),
        ));
  }

  /// 用户登录
  void _login() async {
    Global.loggerNoStack.i({
      'username': _usernameController.text,
      'password': _passwdController.text
    });
    User user;
    try {
      user = await EhUserManager()
          .signIn(_usernameController.text, _passwdController.text);
      Provider.of<UserModel>(context, listen: false).user = user;
    } catch (e) {
      showToast(e.toString());
    }

    if (user != null) {
      NavigatorUtil.goBack(context);
    }
  }
}
