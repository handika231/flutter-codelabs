import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mock_flutter_app/data/model/album_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_album_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('Fetch Album', () {
    test('return an Album if the http call completes successfully', () async {
      final client = MockClient();
      when(
        client.get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        ),
      ).thenAnswer((_) async {
        return http.Response('{"userId": 30, "id": 45, "title": "coba "}', 200);
      });
      expect(await fetchAlbum(client), isA<Album>());
    });
    test('throws an exception if the http call completes with an error',
        () async {
      final client = MockClient();
      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      expect(fetchAlbum(client), throwsException);
    });
  });
}
