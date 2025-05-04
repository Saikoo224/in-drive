import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../styles/app_styles.dart';
import '../providers/theme_provider.dart';
import 'rating_feedback_screen.dart';
import 'map_tracking_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  String _selectedLanguage = 'العربية';

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('الإعدادات', style: AppStyles.titleStyle),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildSectionHeader('الإعدادات العامة'),
          _buildSettingTile(
            icon: Icons.notifications,
            title: 'الإشعارات',
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
          ),
          _buildSettingTile(
            icon: Icons.dark_mode,
            title: 'الوضع الليلي',
            trailing: Switch(
              value: themeProvider.themeMode == ThemeMode.dark,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
            ),
          ),
          _buildSettingTile(
            icon: Icons.language,
            title: 'اللغة',
            trailing: DropdownButton<String>(
              value: _selectedLanguage,
              items: ['العربية', 'English']
                  .map((language) => DropdownMenuItem(
                        value: language,
                        child: Text(language),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value!;
                });
              },
            ),
          ),
          const Divider(),
          _buildSectionHeader('الرحلات'),
          ListTile(
            title: const Text('تتبع الرحلة', style: AppStyles.subtitleStyle),
            leading: const Icon(Icons.map, color: AppStyles.primaryColor),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MapTrackingScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('تقييم الرحلة', style: AppStyles.subtitleStyle),
            leading: const Icon(Icons.star, color: AppStyles.accentColor),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RatingFeedbackScreen()),
              );
            },
          ),
          const Divider(),
          _buildSectionHeader('الحساب'),
          _buildSettingTile(
            icon: Icons.person,
            title: 'تغيير كلمة المرور',
            onTap: () {},
          ),
          _buildSettingTile(
            icon: Icons.payment,
            title: 'طرق الدفع',
            onTap: () {},
          ),
          const Divider(),
          _buildSectionHeader('المزيد'),
          _buildSettingTile(
            icon: Icons.help,
            title: 'المساعدة والدعم',
            onTap: () {},
          ),
          _buildSettingTile(
            icon: Icons.info,
            title: 'عن التطبيق',
            onTap: () {},
          ),
          _buildSettingTile(
            icon: Icons.logout,
            title: 'تسجيل الخروج',
            textColor: AppStyles.errorColor,
            onTap: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppStyles.defaultPadding,
        AppStyles.defaultPadding,
        AppStyles.defaultPadding,
        AppStyles.smallPadding,
      ),
      child: Text(
        title,
        style: AppStyles.titleStyle.copyWith(color: AppStyles.secondaryColor),
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: textColor ?? AppStyles.textPrimaryColor),
      title: Text(
        title,
        style: AppStyles.subtitleStyle.copyWith(
          color: textColor ?? AppStyles.textPrimaryColor,
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
