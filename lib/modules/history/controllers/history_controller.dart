import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  final RxList<Map<String, dynamic>> allTransactions = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> filteredTransactions = <Map<String, dynamic>>[].obs;
  final RxString selectedFilter = 'All'.obs;
  final RxBool isLoading = true.obs;
  final RxString searchQuery = ''.obs;
  final RxString selectedMonth = DateFormat('MMMM yyyy').format(DateTime.now()).obs;
  
  final List<String> filters = ['All', 'Sent', 'Received', 'Failed'];
  final List<String> months = [];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    
    // Generate last 6 months
    final now = DateTime.now();
    for (int i = 0; i < 6; i++) {
      final month = DateTime(now.year, now.month - i, 1);
      months.add(DateFormat('MMMM yyyy').format(month));
    }
    
    fetchTransactions();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void fetchTransactions() {
    isLoading.value = true;
    
    // Simulate API call delay
    Future.delayed(const Duration(seconds: 1), () {
      allTransactions.value = [
        {
          'id': '1',
          'name': 'Raj Kumar',
          'date': '24 Feb 2022',
          'time': '10:45 AM',
          'amount': '₹240.00',
          'type': 'sent',
          'status': 'completed',
          'icon': Icons.directions_car,
          'color': const Color(0xFFE57373),
          'category': 'Transport',
        },
        {
          'id': '2',
          'name': 'Priya Mehta',
          'date': '22 Feb 2022',
          'time': '2:30 PM',
          'amount': '₹1,200.00',
          'type': 'received',
          'status': 'completed',
          'icon': Icons.home,
          'color': const Color(0xFF4DB6AC),
          'category': 'Rent',
        },
        {
          'id': '3',
          'name': 'Electricity Bill',
          'date': '20 Feb 2022',
          'time': '11:15 AM',
          'amount': '₹450.00',
          'type': 'sent',
          'status': 'completed',
          'icon': Icons.bolt,
          'color': const Color(0xFFFFB74D),
          'category': 'Utilities',
        },
        {
          'id': '4',
          'name': 'Anil Sharma',
          'date': '18 Feb 2022',
          'time': '9:20 AM',
          'amount': '₹500.00',
          'type': 'sent',
          'status': 'failed',
          'icon': Icons.person,
          'color': const Color(0xFF9575CD),
          'category': 'Friends',
        },
        {
          'id': '5',
          'name': 'Salary Deposit',
          'date': '15 Feb 2022',
          'time': '10:00 AM',
          'amount': '₹25,000.00',
          'type': 'received',
          'status': 'completed',
          'icon': Icons.work,
          'color': const Color(0xFF81C784),
          'category': 'Income',
        },
        {
          'id': '6',
          'name': 'Water Bill',
          'date': '12 Feb 2022',
          'time': '3:45 PM',
          'amount': '₹320.00',
          'type': 'sent',
          'status': 'completed',
          'icon': Icons.water_drop,
          'color': const Color(0xFF64B5F6),
          'category': 'Utilities',
        },
        {
          'id': '7',
          'name': 'Grocery Store',
          'date': '10 Feb 2022',
          'time': '6:30 PM',
          'amount': '₹850.00',
          'type': 'sent',
          'status': 'completed',
          'icon': Icons.shopping_cart,
          'color': const Color(0xFFBA68C8),
          'category': 'Shopping',
        },
        {
          'id': '8',
          'name': 'Neha Singh',
          'date': '8 Feb 2022',
          'time': '1:15 PM',
          'amount': '₹300.00',
          'type': 'received',
          'status': 'completed',
          'icon': Icons.person,
          'color': const Color(0xFF4FC3F7),
          'category': 'Friends',
        },
        {
          'id': '9',
          'name': 'Internet Bill',
          'date': '5 Feb 2022',
          'time': '11:30 AM',
          'amount': '₹999.00',
          'type': 'sent',
          'status': 'completed',
          'icon': Icons.language,
          'color': const Color(0xFFFFB74D),
          'category': 'Utilities',
        },
        {
          'id': '10',
          'name': 'Restaurant',
          'date': '3 Feb 2022',
          'time': '8:45 PM',
          'amount': '₹1,250.00',
          'type': 'sent',
          'status': 'completed',
          'icon': Icons.restaurant,
          'color': const Color(0xFFE57373),
          'category': 'Food',
        },
      ];
      
      applyFilters();
      isLoading.value = false;
    });
  }

  void applyFilters() {
    if (selectedFilter.value == 'All') {
      filteredTransactions.value = allTransactions;
    } else if (selectedFilter.value == 'Sent') {
      filteredTransactions.value = allTransactions.where((tx) => tx['type'] == 'sent').toList();
    } else if (selectedFilter.value == 'Received') {
      filteredTransactions.value = allTransactions.where((tx) => tx['type'] == 'received').toList();
    } else if (selectedFilter.value == 'Failed') {
      filteredTransactions.value = allTransactions.where((tx) => tx['status'] == 'failed').toList();
    }
    
    // Apply search if any
    if (searchQuery.value.isNotEmpty) {
      filteredTransactions.value = filteredTransactions.where(
        (tx) => tx['name'].toString().toLowerCase().contains(searchQuery.value.toLowerCase()) ||
                tx['category'].toString().toLowerCase().contains(searchQuery.value.toLowerCase())
      ).toList();
    }
  }

  void changeFilter(String filter) {
    selectedFilter.value = filter;
    applyFilters();
  }
  
  void search(String query) {
    searchQuery.value = query;
    applyFilters();
  }
  
  void changeMonth(String month) {
    selectedMonth.value = month;
    // In a real app, you would fetch transactions for this month
    fetchTransactions();
  }
  
  void viewTransactionDetails(String id) {
    final transaction = allTransactions.firstWhere((tx) => tx['id'] == id);
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: (transaction['color'] as Color).withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                transaction['icon'] as IconData,
                color: transaction['color'] as Color,
                size: 30,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              transaction['name'] as String,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '${transaction['date']} at ${transaction['time']}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  transaction['amount'] as String,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: transaction['type'] == 'received' ? Colors.green : Colors.black,
                  ),
                ),
                const SizedBox(width: 10),
                Icon(
                  transaction['type'] == 'received' ? Icons.arrow_downward : Icons.arrow_upward,
                  color: transaction['type'] == 'received' ? Colors.green : Colors.black,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: transaction['status'] == 'completed' ? Colors.green.shade100 : Colors.red.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                transaction['status'].toString().toUpperCase(),
                style: TextStyle(
                  color: transaction['status'] == 'completed' ? Colors.green.shade800 : Colors.red.shade800,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Transaction ID',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '#${transaction['id']}${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Category',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  transaction['category'] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Get.back(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
