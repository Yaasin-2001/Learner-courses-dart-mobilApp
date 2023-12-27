import 'package:postgres/postgres.dart';

/*var databaseConnection = PostgreSQLConnection(
    "91.225.104.133", 5432, 'learning',
    queryTimeoutInSeconds: 3600,
    timeoutInSeconds: 3600,
    username: 'learning',
    password: 'jI13K02U');*/

Future<void> checkPostgreSQLConnection() async {
  final connection = PostgreSQLConnection(
    '91.225.104.133',
    5432,
    'learning',
    username: 'learning',
    password: 'jI13K02U',
  );

  try {
    await connection.open();
    print('Connected to PostgreSQL!');
    await connection.close();
  } catch (e) {
    print('Failed to connect to PostgreSQL: $e');
  }
}
