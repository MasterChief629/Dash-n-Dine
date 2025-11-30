import 'package:dash_n_dine/widgets/icon_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:dash_n_dine/widgets/icon_widget.dart';

class NotificationsPage extends StatelessWidget{
static const keyOrderUpdate = 'key-order-update';

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
    title: 'Notifications',
    subtitle: 'Order progress, placeholder text',
    leading: IconWidget(icon: Icons.notifications, color: Colors.green),
    child: SettingsScreen(
      title: 'Notifications',
      children: <Widget>[
        buildOrderUpdate(),
      ]
    ), 
  );
  Widget buildOrderUpdate() => SwitchSettingsTile(
    settingKey: keyOrderUpdate,
    title: 'Get notified of your order status', 
    leading: IconWidget(icon: Icons.timer_outlined, color: CupertinoColors.systemYellow),);
}