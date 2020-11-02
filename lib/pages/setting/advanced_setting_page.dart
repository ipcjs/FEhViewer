import 'package:FEhViewer/common/global.dart';
import 'package:FEhViewer/models/states/locale_model.dart';
import 'package:FEhViewer/values/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'setting_base.dart';

class AdvancedSettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AdvancedSettingPageState();
  }
}

class AdvancedSettingPageState extends State<AdvancedSettingPage> {
  final String _title = '高级设置';
  @override
  Widget build(BuildContext context) {
    final CupertinoPageScaffold cps = CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: ThemeColors.navigationBarBackground,
          transitionBetweenRoutes: true,
          middle: Text(_title),
        ),
        child: SafeArea(
          child: ListViewAdvancedSetting(),
        ));

    return cps;
  }
}

class ListViewAdvancedSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          _buildLanguageItem(context),
        ],
      ),
    );
  }

  /// 语言设置部件
  Widget _buildLanguageItem(BuildContext context) {
    const String _title = '语言设置';
    final LocaleModel localeModel =
        Provider.of<LocaleModel>(context, listen: false);

    final Map<String, String> localeMap = <String, String>{
      '': '系统语言(默认)',
      'zh_CN': '简体中文',
      'en_US': 'English',
    };

    List<Widget> _getLocaleList(BuildContext context) {
      return List<Widget>.from(localeMap.keys.map((String element) {
        return CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context, element);
            },
            child: Text(localeMap[element]));
      }).toList());
    }

    Future<String> _showDialog(BuildContext context) {
      return showCupertinoModalPopup<String>(
          context: context,
          builder: (BuildContext context) {
            final CupertinoActionSheet dialog = CupertinoActionSheet(
              title: const Text('语言选择'),
              cancelButton: CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('取消')),
              actions: <Widget>[
                ..._getLocaleList(context),
              ],
            );
            return dialog;
          });
    }

    return Selector<LocaleModel, String>(
        selector: (BuildContext context, LocaleModel localeModel) =>
            localeMap[localeModel.locale ?? ''],
        builder: (BuildContext context, String locale, _) {
          return SelectorSettingItem(
            title: _title,
            selector: locale,
            onTap: () async {
              Global.logger.v('tap LanguageItem');
              final String _result = await _showDialog(context);
              if (_result is String) {
                localeModel.locale = _result;
              }
              Global.logger.v('$_result');
            },
          );
        });
  }
}