import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CounterContainer extends StatefulWidget {
  const CounterContainer({super.key});

  @override
  State<CounterContainer> createState() => _CounterContainerState();
}

class _CounterContainerState extends State<CounterContainer> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleClickContainer,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: _value ? Colors.blue : Colors.red,
        ),
        width: 100.r,
        height: 100.r,
        duration: const Duration(milliseconds: 325),
        child: Center(
          child: Text(
            'Size: ${100.r.toStringAsFixed(3)}',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 12.sp,
                ),
          ),
        ),
      ),
    );
  }

  void _handleClickContainer() {
    setState(() {
      _value = !_value;
    });
  }
}
