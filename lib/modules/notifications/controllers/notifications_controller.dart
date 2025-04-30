import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  final RxList<Map<String, dynamic>> allNotifications = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> transactionNotifications = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> promotionNotifications = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> accountNotifications = <Map<String, dynamic>>[].obs;
  final RxBool isLoading = true.obs;
  
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 4, vsync: this);
    fetchNotifications();
    
    // Listen to tab changes
    tabController.addListener(() {
      update();
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void fetchNotifications() {
    isLoading.value = true;
    
    // Simulate API call delay
    Future.delayed(const Duration(seconds: 1), () {
      allNotifications.value = [
        {
          'id': '1',
          'title': 'Payment Successful',
          'message': 'Your payment of ₹240.00 to Raj Kumar was successful.',
          'time': '10:45 AM',
          'date': 'Today',
          'isRead': false,
          'type': 'transaction',
          'icon': Icons.check_circle,
          'color': Colors.green,
        },
        {
          'id': '2',
          'title': '50% Cashback Offer',
          'message': 'Get 50% cashback on your next transaction. Limited time offer!',
          'time': '2:30 PM',
          'date': 'Yesterday',
          'isRead': true,
          'type': 'promotion',
          'icon': Icons.local_offer,
          'color': Colors.orange,
        },
        {
          'id': '3',
          'title': 'Security Alert',
          'message': 'Your account was accessed from a new device. Please verify if it was you.',
          'time': '11:15 AM',
          'date': 'Yesterday',
          'isRead': false,
          'type': 'account',
          'icon': Icons.security,
          'color': Colors.red,
        },
        {
          'id': '4',
          'title': 'Money Received',
          'message': 'You received ₹1,200.00 from Priya Mehta.',
          'time': '9:20 AM',
          'date': '22 Feb 2022',
          'isRead': true,
          'type': 'transaction',
          'icon': Icons.arrow_downward,
          'color': Colors.green,
        },
        {
          'id': '5',
          'title': 'New Feature Available',
          'message': 'Try our new QR code payment feature for faster transactions!',
          'time': '10:00 AM',
          'date': '20 Feb 2022',
          'isRead': true,
          'type': 'promotion',
          'icon': Icons.new_releases,
          'color': Colors.blue,
        },
        {
          'id': '6',
          'title': 'Password Changed',
          'message': 'Your account password was successfully changed.',
          'time': '3:45 PM',
          'date': '18 Feb 2022',
          'isRead': true,
          'type': 'account',
          'icon': Icons.lock,
          'color': Colors.purple,
        },
        {
          'id': '7',
          'title': 'Bill Payment Reminder',
          'message': 'Your electricity bill payment is due in 2 days.',
          'time': '6:30 PM',
          'date': '15 Feb 2022',
          'isRead': true,
          'type': 'transaction',
          'icon': Icons.notification_important,
          'color': Colors.amber,
        },
        {
          'id': '8',
          'title': 'Weekend Offer',
          'message': 'Enjoy zero transaction fees this weekend!',
          'time': '1:15 PM',
          'date': '12 Feb 2022',
          'isRead': true,
          'type': 'promotion',
          'icon': Icons.card_giftcard,
          'color': Colors.pink,
        },
      ];
      
      // Filter notifications by type
      transactionNotifications.value = allNotifications.where((n) => n['type'] == 'transaction').toList();
      promotionNotifications.value = allNotifications.where((n) => n['type'] == 'promotion').toList();
      accountNotifications.value = allNotifications.where((n) => n['type'] == 'account').toList();
      
      isLoading.value = false;
    });
  }
  
  void markAsRead(String id) {
    final index = allNotifications.indexWhere((n) => n['id'] == id);
    if (index != -1) {
      allNotifications[index]['isRead'] = true;
      
      // Update filtered lists
      transactionNotifications.value = allNotifications.where((n) => n['type'] == 'transaction').toList();
      promotionNotifications.value = allNotifications.where((n) => n['type'] == 'promotion').toList();
      accountNotifications.value = allNotifications.where((n) => n['type'] == 'account').toList();
    }
  }
  
  void markAllAsRead() {
    for (var notification in allNotifications) {
      notification['isRead'] = true;
    }
    
    // Update filtered lists
    transactionNotifications.value = allNotifications.where((n) => n['type'] == 'transaction').toList();
    promotionNotifications.value = allNotifications.where((n) => n['type'] == 'promotion').toList();
    accountNotifications.value = allNotifications.where((n) => n['type'] == 'account').toList();
  }
  
  void deleteNotification(String id) {
    allNotifications.removeWhere((n) => n['id'] == id);
    
    // Update filtered lists
    transactionNotifications.value = allNotifications.where((n) => n['type'] == 'transaction').toList();
    promotionNotifications.value = allNotifications.where((n) => n['type'] == 'promotion').toList();
    accountNotifications.value = allNotifications.where((n) => n['type'] == 'account').toList();
  }
  
  int get unreadCount => allNotifications.where((n) => n['isRead'] == false).length;
}
