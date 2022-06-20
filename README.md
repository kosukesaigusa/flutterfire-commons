## Usage

```dart
import 'package:http/http.dart' as http;
import 'package:http_client/http_client.dart';
final res = await http.get(Uri.parse(url));
if (res.statusCode == StatusCode.OK.code || res.statusCode == StatusCode.Created.code) {
  final statusMessage = getStatusCode(res.statusCode).message;
  final statusMessageInJP = getStatusCode(res.statusCode).messageInJP;

  return {
    'statusCode': res.statusCode,
    'statusMessage': statusMessage,
    'data': res.body
  };
}
```