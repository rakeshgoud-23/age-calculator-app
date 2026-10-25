import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AgeCalculator(),
    ));

class AgeCalculator extends StatefulWidget {
  const AgeCalculator({super.key});

  @override
  State<AgeCalculator> createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  DateTime? birthDate;
  String result = 'Select your date of birth';

  DateTime addMonthsClamped(DateTime date, int months) {
    final target = DateTime(date.year, date.month + months, 1);
    final lastDay = DateTime(target.year, target.month + 1, 0).day;
    return DateTime(target.year, target.month,
        date.day < lastDay ? date.day : lastDay);
  }

  void calculateAge() {
    if (birthDate == null) return;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    int totalMonths = (today.year - birthDate!.year) * 12 +
        today.month - birthDate!.month;
    if (addMonthsClamped(birthDate!, totalMonths).isAfter(today)) {
      totalMonths--;
    }
    final days = today.difference(
      addMonthsClamped(birthDate!, totalMonths),
    ).inDays;
    setState(() {
      result = '${totalMonths ~/ 12} Years, '
          '${totalMonths % 12} Months, $days Days';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Age Calculator'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cake, size: 80, color: Colors.blue),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: birthDate ?? DateTime(2005),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    birthDate = date;
                    calculateAge();
                  }
                },
                child: const Text('Select Date of Birth'),
              ),
              const SizedBox(height: 24),
              Text(
                result,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
