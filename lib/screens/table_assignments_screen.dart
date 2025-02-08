import 'package:flutter/material.dart';

import '../models/table_assignment.dart';

class TableAssignmentsScreen extends StatelessWidget {
  final List<TableAssignment> tables = [
    TableAssignment(
      tableName: 'Table 1 - Family',
      guests: ['John Smith', 'Jane Smith', 'Mike Johnson'],
      maxCapacity: 8,
    ),
    // Add more tables
  ];

  TableAssignmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seating Arrangements'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tables.length,
        itemBuilder: (context, index) {
          final table = tables[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ExpansionTile(
              title: Text(table.tableName),
              subtitle: Text(
                  '${table.guests.length}/${table.maxCapacity} seats filled'),
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: table.guests.length,
                  itemBuilder: (context, guestIndex) {
                    return ListTile(
                      title: Text(table.guests[guestIndex]),
                      leading: const Icon(Icons.person),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
