// // // // import 'package:dio/dio.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:json_annotation/json_annotation.dart';
// // // // import 'package:retrofit/retrofit.dart';
// 
// // // part 'auth_example.g.dart';
// 
// // // @JsonSerializable()
// // // class Album {
// //   const Album({required this.id, required this.title});
// 
// //   final int id;
// //   final String title;
// 
// //   factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
// //   Map<String, dynamic> toJson() => _$AlbumToJson(this);
// // // }
// 
// // // @RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
// // // abstract class AuthApi {
// //   factory AuthApi(Dio dio, {String? baseUrl}) = _AuthApi;
// 
// //   @GET('/albums/{id}')
// //   Future<Album> getAlbum(@Path('id') int id);
// // // }
// 
// // // class TokenInterceptor extends QueuedInterceptor {
// //   TokenInterceptor(this._readToken);
// 
// //   final Future<String?> Function() _readToken;
// 
// //   @override
// //   Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
// //     final token = await _readToken();
// //     if (token != null && token.isNotEmpty) {
// //       options.headers['Authorization'] = 'Bearer $token';
// //     }
// //     handler.next(options);
// //   }
// // // }
// 
// // // class AuthExample extends StatefulWidget {
// //   const AuthExample({super.key});
// 
// //   @override
// //   State<AuthExample> createState() => _AuthExampleState();
// // // }
// 
// // // class _AuthExampleState extends State<AuthExample> {
// //   final TextEditingController _tokenController = TextEditingController();
// //   Future<Album>? _futureAlbum;
// 
// //   Future<String?> _readToken() async => _tokenController.text.trim();
// 
// //   late final AuthApi _api = () {
// //     final dio = Dio();
// //     dio.interceptors.add(TokenInterceptor(_readToken));
// //     return AuthApi(dio);
// //   }();
// 
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Dio Auth Interceptor Example')),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16),
// //         child: Column(
// //           children: [
// //             TextField(
// //               controller: _tokenController,
// //               decoration: const InputDecoration(labelText: 'Bearer token', hintText: 'paste token'),
// //             ),
// //             const SizedBox(height: 12),
// //             ElevatedButton(
// //               onPressed: () {
// //                 setState(() {
// //                   _futureAlbum = _api.getAlbum(1);
// //                 });
// //               },
// //               child: const Text('Fetch Album'),
// //             ),
// //             const SizedBox(height: 20),
// //             Expanded(
// //               child: FutureBuilder<Album>(
// //                 future: _futureAlbum,
// //                 builder: (context, snapshot) {
// //                   if (_futureAlbum == null) {
// //                     return const Center(child: Text('Provide token and run request'));
// //                   }
// //                   if (snapshot.connectionState == ConnectionState.waiting) {
// //                     return const Center(child: CircularProgressIndicator());
// //                   }
// //                   if (snapshot.hasError) {
// //                     return Center(child: Text('Error: ${snapshot.error}'));
// //                   }
// //                   if (snapshot.hasData) {
// //                     return Center(
// //                       child: Text('Album ${snapshot.data!.id}: ${snapshot.data!.title}'),
// //                     );
// //                   }
// //                   return const SizedBox.shrink();
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // // }
