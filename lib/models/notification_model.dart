class NotificationModel {
  final String image;
  final String message;
  bool isRead;
  final String senderName;
  NotificationModel({
    required this.image,
    required this.message,
    this.isRead = false,
    required this.senderName,
  });
}

List<NotificationModel> notificationList = [
  NotificationModel(
      image: 'assets/images/sansam.png',
      message: 'accepted your offer request',
      isRead: true,
      senderName: 'Sans Sam’s'),
  NotificationModel(
      image: 'assets/images/sansam.png',
      message: ' accepted your offer request',
      senderName: 'Sans Sam’s'),
  NotificationModel(
      image: 'assets/images/sansam.png',
      message: ' accepted your offer request',
      senderName: 'Sans Sam’s'),
];
