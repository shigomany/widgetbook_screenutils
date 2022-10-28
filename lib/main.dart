import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_screenutils/widgets/counter_container.dart';

void main() {
  runApp(const WidgetBookSU());
}

class WidgetBookSU extends StatefulWidget {
  const WidgetBookSU({super.key});

  @override
  State<WidgetBookSU> createState() => _WidgetBookSUState();
}

class _WidgetBookSUState extends State<WidgetBookSU> {
  late Device _currentDevice;
  late List<Device> _devices;

  @override
  void initState() {
    super.initState();
    _devices = [
      Apple.iPhoneSE2016,
      Apple.iPhone11,
      Apple.iPhone12,
    ];
    _currentDevice = _devices.first;
  }

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      appInfo: AppInfo(name: 'Widgetbook + ScreenUtils'),
      devices: _devices,
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: ThemeData.light(),
        ),
      ],
      categories: [
        WidgetbookCategory(
          name: 'Widgets',
          widgets: [
            WidgetbookComponent(
              name: '$CounterContainer',
              useCases: [
                WidgetbookUseCase.center(
                  name: '$CounterContainer - Example',
                  child: const CounterContainer(),
                ),
              ],
            ),
          ],
        ),
      ],
      deviceFrameBuilder: (context, device, frame, orientation, child) {
        if (_currentDevice != device) {
          _currentDevice = device;
        }
        return defaultDeviceFrameBuilder(
          context,
          device,
          frame,
          orientation,
          child,
        );
      },
      textScaleFactors: [1],
      appBuilder: (context, child) {
        final size = _currentDevice.resolution.logicalSize;
        final changedSize = Size(size.width, size.height);
        final scaleRatio = _currentDevice.resolution.scaleFactor;
        return ScreenUtilInit(
          builder: (context, child) => child!,
          useInheritedMediaQuery: true,
          minTextAdapt: true,
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              size: changedSize,
              devicePixelRatio: scaleRatio,
            ),
            child: child,
          ),
        );
      },
    );
  }
}
