import 'package:flutter/cupertino.dart';

class Job {
  Job({@required this.name, @required this.rate});

  final String name;
  final int rate;

  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'rate': rate,
    };
  }
}
