import 'package:flutter/material.dart';
import 'package:sia_fect/core/const/strings.dart';

class ItemsSection extends StatelessWidget {
  final Map data;
  const ItemsSection({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(vertical: 8),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            child: Text(
              data['name'] ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Row(
            children: [
              const Text('${Strings.lecturer}: '),
              Text(
                data['lecture'] ?? '',
              )
            ],
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              const Text('${Strings.room}: '),
              Text(data['room'] ?? ''),
            ],
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              const Text('${Strings.time}: '),
              Text(data['time'] ?? ''),
            ],
          ),
          const SizedBox(height: 8)
        ],
      ),
    );
  }
}
