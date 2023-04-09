// dependencies:
//   flutter_local_notifications: ^8.2.0

class _MyWidgetState extends State<MyWidget> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
        onDidReceiveLocalNotification:
            (int id, String title, String body, String payload) async {});
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) async {
      if (payload != null) {
        debugPrint('notification payload: ' + payload);
      }
    });
  }
}

// Step 4: Write a method to schedule the local notification.

Future<void> _scheduleNotification(Duration duration) async {
  var scheduledNotificationDateTime = DateTime.now().add(duration);
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    'your channel description',
    importance: Importance.max,
    priority: Priority.high,
  );
  var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.schedule(
      0,
      'Vaccine Alert',
      'Your child needs to get vaccinated today',
      scheduledNotificationDateTime,
      platformChannelSpecifics);
}


// Step: here's a complete implementation of the checkVaccineSchedule() method, with the internal implementation included:
import 'package:cloud_firestore/cloud_firestore.dart';

void checkVaccineSchedule(String childId) async {
  // Get child's last vaccine serial number from the database
  final childDoc =
      await FirebaseFirestore.instance.collection('children').doc(childId).get();
  final lastVaccineSerial = childDoc.data()['last_vaccine_serial'] as int;

  // Get the last vaccination date and add the duration to it
  final vaccineDoc = await FirebaseFirestore.instance
      .collection('vaccines')
      .doc(lastVaccineSerial.toString())
      .get();
  final lastVaccineDate = vaccineDoc.data()['date'] as Timestamp;
  final vaccineDuration = Duration(days: vaccineDoc.data()['duration'] as int);
  final scheduledDate = lastVaccineDate.toDate().add(vaccineDuration);

  // Check if the current date is greater than or equal to the scheduled date
  final currentDate = DateTime.now();
  if (currentDate.isAfter(scheduledDate) || currentDate.isAtSameMomentAs(scheduledDate)) {
    // If yes, schedule the local notification
    _scheduleNotification(scheduledDate);
  }
}

Future<void> _scheduleNotification(DateTime scheduledDateTime) async {
  final androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    'your channel description',
    importance: Importance.max,
    priority: Priority.high,
  );
  final iOSPlatformChannelSpecifics = IOSNotificationDetails();
  final platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: iOSPlatformChannelSpecifics,
  );
  await flutterLocalNotificationsPlugin.schedule(
    0,
    'Vaccine Alert',
    'Your child needs to get vaccinated today',
    scheduledDateTime,
    platformChannelSpecifics,
    payload: 'your payload',
  );
}
