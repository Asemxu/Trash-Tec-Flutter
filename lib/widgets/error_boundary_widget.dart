import 'package:flutter/material.dart';

class ErrorBoundary extends StatefulWidget {
  final Widget child;

  const ErrorBoundary({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<ErrorBoundary> createState() => _ErrorBoundaryState();
}

class _ErrorBoundaryState extends State<ErrorBoundary> {
  bool hasError = false;
  FlutterErrorDetails? errorDetails;

  @override
  void initState() {
    super.initState();
    FlutterError.onError = (FlutterErrorDetails details) {
      setState(() {
        hasError = true;
        errorDetails = details;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    if (hasError) {
      return Material(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              const SizedBox(height: 16),
              const Text(
                'Algo salió mal',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                errorDetails?.exception.toString() ?? 'Error desconocido',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    return widget.child;
  }
}