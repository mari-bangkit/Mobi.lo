import 'package:flutter/material.dart';

import '../../../Constant/style.dart';

class TimeField extends StatelessWidget {
  const TimeField({
    Key? key,
    required this.eventTime,
  }) : super(key: key);
  final TimeOfDay? eventTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kLightGray.withOpacity(0.3),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              eventTime == null
                  ? "Select the event time"
                  : eventTime!.format(context),
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Icon(
            Icons.timer_rounded,
            size: 18.0,
          ),
        ],
      ),
    );
  }
}
