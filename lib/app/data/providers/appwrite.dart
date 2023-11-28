import 'package:appwrite/appwrite.dart';

class AppWriteProvider {
  final String endpoint;
  final bool selfSigned;
  final String locale;

  late final Client client;
  late final Account account;
  late final Avatars avatars;
  late final Databases databases;

  AppWriteProvider({
    required this.endpoint,
    this.selfSigned = false,
    required this.locale,
  }) {
    client = Client(endPoint: endpoint, selfSigned: selfSigned)
        .setLocale(locale)
        .setProject('calendula');

    account = Account(client);
    avatars = Avatars(client);
    databases = Databases(client);
  }
}
