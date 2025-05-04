import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'providers/profile_provider.dart';
import 'providers/notification_provider.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/edit_profile_screen.dart';
import 'screens/notification_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/settingspage.dart';
import 'screens/map_tracking_screen.dart';
import 'screens/rating_feedback_screen.dart';
import 'screens/support_screen.dart';
import 'screens/ride_details_screen.dart';
import 'screens/payment_screen.dart';
import 'screens/booking_screen.dart';
import 'screens/Ride_history_screen.dart';
import 'styles/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'تطبيق النقل',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            debugShowCheckedModeBanner: false,
            initialRoute: '/login',
            routes: {
              '/login': (context) => const LoginScreen(),
              '/signup': (context) => const SignupScreen(),
              '/': (context) => HomeScreen(),
              '/profile': (context) => ProfileScreen(),
              '/edit-profile': (context) => EditProfileScreen(),
              '/notifications': (context) => NotificationScreen(),
              '/settings': (context) => const SettingsScreen(),
              '/map-tracking': (context) => const MapTrackingScreen(),
              '/rating': (context) => const RatingFeedbackScreen(),
              '/support': (context) => const SupportScreen(),
              '/ride-details': (context) => const RideDetailsScreen(),
              '/payment': (context) => const PaymentScreen(),
              '/booking': (context) => const BookingScreen(),
              '/ride-history': (context) => const RideHistoryScreen(),
            },
          );
        },
      ),
    );
  }
}