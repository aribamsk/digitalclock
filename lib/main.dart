import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const DigitalClockApp());
}

class DigitalClockApp extends StatelessWidget {
  const DigitalClockApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DigitalClockScreen(),
    );
  }
}

class DigitalClockScreen extends StatefulWidget {
  @override
  _DigitalClockScreenState createState() => _DigitalClockScreenState();
}

class _DigitalClockScreenState extends State<DigitalClockScreen> {
  late String _timeString;

  @override
  void initState() {
    super.initState();
    _timeString = _formatCurrentTime();
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _updateTime());
  }

  void _updateTime() {
    setState(() {
      _timeString = _formatCurrentTime();
    });
  }

  String _formatCurrentTime() {
    final DateTime now = DateTime.now();
    return "${_addLeadingZero(now.hour)}:${_addLeadingZero(now.minute)}:${_addLeadingZero(now.second)}";
  }

  String _addLeadingZero(int value) {
    return value < 10 ? "0$value" : value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Clock'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text(
          _timeString,
          style: const TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
