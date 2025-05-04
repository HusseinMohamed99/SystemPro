String timeAgo(String dateTimeString) {
  // تحويل التاريخ من السلسلة إلى كائن DateTime
  final DateTime storyTime = DateTime.parse(dateTimeString);
  final DateTime currentTime = DateTime.now(); // التاريخ الحالي

  // حساب الفرق بين التاريخين
  final Duration difference = currentTime.difference(storyTime);

  // التحقق من الفترات المختلفة (ساعات، أيام، إلخ)
  if (difference.inDays > 1) {
    return '${difference.inDays} days ago';
  } else if (difference.inDays == 1) {
    return '1 day ago';
  } else if (difference.inHours > 1) {
    return '${difference.inHours} hours ago';
  } else if (difference.inHours == 1) {
    return '1 hour ago';
  } else if (difference.inMinutes > 1) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inMinutes == 1) {
    return '1 minute ago';
  } else {
    return 'Just now';
  }
}
