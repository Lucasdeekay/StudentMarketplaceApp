import 'package:intl/intl.dart';

greeting() {
  var now = DateTime.now();
  var formattedTime = DateFormat('h:mm a').format(now);

  String greeting;
  if (now.hour < 12) {
    greeting = "Good Morning";
  } else if (now.hour < 17) {
    greeting = "Good Afternoon";
  } else {
    greeting = "Good Night";
  }

  return '$greeting! It is $formattedTime.';
}

