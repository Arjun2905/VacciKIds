import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class NotificationService {
  int num = 1;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future initialize() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    AndroidInitializationSettings androidInitializationSettings =
    const AndroidInitializationSettings("img4");

    final InitializationSettings initializationSettings =
    InitializationSettings(
      android: androidInitializationSettings,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future instantNotification() async {
    print("Entered in instance");
    var android = const AndroidNotificationDetails("id", "channel",
        channelDescription: "description");
    print("Platform");

    var platform = NotificationDetails(
      android: android,
    );
    print("Calling method");
    await _flutterLocalNotificationsPlugin.show(
        num++,
        "Vaccine Alert",
        "Your child needs to take vaccine today",
        platform,
        payload: "Welcome to VacciKids");
  }

  // Future scheduledNotification(String startTime) async {
  //   tz.initializeTimeZones();
  //   var location = tz.local;
  //   DateTime scheduleTime;
  //   scheduleTime = DateTime.parse(startTime);
  //
  //   if (scheduleTime.compareTo(DateTime.now()) < 0) {
  //     instantNotification();
  //   } else {
  //     var xTime = tz.TZDateTime.from(scheduleTime, location);
  //     var bigPicture = const BigPictureStyleInformation(
  //         DrawableResourceAndroidBitmap("logo"),
  //         contentTitle: "Vaccine Alert!!!",
  //         summaryText: "Vaccine Alert",
  //         htmlFormatContent: true,
  //         htmlFormatContentTitle: true);
  //
  //     var android = AndroidNotificationDetails("id", "channel",
  //         channelDescription: "description",
  //         styleInformation: bigPicture,
  //         priority: Priority.high,
  //         visibility: NotificationVisibility.public);
  //
  //     var platform = NotificationDetails(android: android);
  //
  //     await _flutterLocalNotificationsPlugin.zonedSchedule(
  //         num++,
  //         "Vaccine Alert!!!",
  //         "Vaccine Alert",
  //         xTime,
  //         platform,
  //         uiLocalNotificationDateInterpretation:
  //         UILocalNotificationDateInterpretation.absoluteTime,
  //         androidAllowWhileIdle: true);
  //     print("notification set.");
  //   }

// Schedule notification based on date of birth and vaccine duration
  Future<void> scheduleNotification(String dob, dynamic vaccineDuration) async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    tz.initializeTimeZones();
    // Initialize the notification plugin
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');
    const InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Calculate the notification date based on the date of birth and vaccine duration
    final DateTime dateOfBirth = DateTime.parse(dob);
    final DateTime notificationDate = dateOfBirth.add(Duration(
        days: (vaccineDuration is double ? (vaccineDuration * 30).toInt() : vaccineDuration)));

    // Get the current timezone
    final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();

    // Define the notification details
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails('your_channel_id', 'your_channel_name',
        channelDescription: 'your_channel_description');
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    // Schedule the notification
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0, // Notification ID
      'Vaccine Reminder', // Notification title
      'It\'s time for the vaccine!', // Notification body
      tz.TZDateTime.from(notificationDate, tz.local), // Notification date and time
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  Future cancelNotification() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}
