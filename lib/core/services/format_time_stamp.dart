import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String formatTimestamp(Timestamp timestamp) {
  DateTime postDate = timestamp.toDate();
  DateTime now = DateTime.now();
  Duration difference = now.difference(postDate);

  if (difference.inDays < 1) {
    if (difference.inHours < 1) {
      if (difference.inMinutes < 1) {
        return '${difference.inSeconds}s ago';
      }
      return '${difference.inMinutes}m ago';
    }
    return '${difference.inHours}h ago';
  } else if (difference.inDays < 7) {
    return '${difference.inDays}d ago';
  } else if (difference.inDays < 30) {
    return '${(difference.inDays / 7).floor()}w ago';
  } else if (difference.inDays < 365) {
    return DateFormat('MMM d').format(postDate);
  } else {
    return DateFormat('yyyy MMM d').format(postDate);
  }
}
