import 'package:flutter/foundation.dart';

const schema = kIsWeb ? 'https' : 'calendula';
const domain = kIsWeb
    ? String.fromEnvironment('CALENDULA_DOMAIN', defaultValue: 'localhost:8080')
    : 'app';
