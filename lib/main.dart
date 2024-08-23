import 'package:flutter/material.dart';
import 'package:flutter_application_practice/core/routing/app_router.dart';
import 'package:flutter_application_practice/doc_app.dart';

void main() {
  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}
