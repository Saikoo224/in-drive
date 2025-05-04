import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../styles/app_styles.dart';

class MapTrackingScreen extends StatefulWidget {
  const MapTrackingScreen({Key? key}) : super(key: key);

  @override
  _MapTrackingScreenState createState() => _MapTrackingScreenState();
}

class _MapTrackingScreenState extends State<MapTrackingScreen> {
  GoogleMapController? mapController;
  Position? _currentPosition;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        _currentPosition = position;
        _isLoading = false;
      });

      if (mapController != null) {
        mapController!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 15.0,
            ),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (_currentPosition != null) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
            zoom: 15.0,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (_isLoading)
            const Center(child: CircularProgressIndicator())
          else
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _currentPosition != null
                    ? LatLng(_currentPosition!.latitude, _currentPosition!.longitude)
                    : const LatLng(24.7136, 46.6753), // الرياض كموقع افتراضي
                zoom: 15.0,
              ),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: true,
              mapToolbarEnabled: false,
            ),
          Positioned(
            top: 50,
            left: AppStyles.defaultPadding,
            right: AppStyles.defaultPadding,
            child: Container(
              padding: const EdgeInsets.all(AppStyles.defaultPadding),
              decoration: AppStyles.cardDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'تتبع الرحلة',
                    style: AppStyles.subheadingStyle,
                  ),
                  const SizedBox(height: AppStyles.smallPadding),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: AppStyles.errorColor),
                      const SizedBox(width: AppStyles.smallPadding),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'الموقع الحالي',
                              style: AppStyles.subtitleStyle,
                            ),
                            Text(
                              _currentPosition != null
                                  ? '${_currentPosition!.latitude.toStringAsFixed(4)}, ${_currentPosition!.longitude.toStringAsFixed(4)}'
                                  : 'جاري تحديد الموقع...',
                              style: AppStyles.bodyStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: AppStyles.defaultPadding,
            right: AppStyles.defaultPadding,
            child: Container(
              padding: const EdgeInsets.all(AppStyles.defaultPadding),
              decoration: AppStyles.cardDecoration,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'معلومات الرحلة',
                        style: AppStyles.titleStyle,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppStyles.defaultPadding,
                          vertical: AppStyles.smallPadding,
                        ),
                        decoration: AppStyles.statusDecoration,
                        child: const Text(
                          'قيد التنفيذ',
                          style: AppStyles.buttonTextStyle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppStyles.defaultPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoColumn('المسافة', '5.2 كم'),
                      _buildInfoColumn('الوقت', '15 دقيقة'),
                      _buildInfoColumn('السعر', '25 ريال'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: AppStyles.bodyStyle,
        ),
        const SizedBox(height: AppStyles.smallPadding),
        Text(
          value,
          style: AppStyles.subtitleStyle,
        ),
      ],
    );
  }
}
