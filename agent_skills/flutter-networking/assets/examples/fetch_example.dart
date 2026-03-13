// // // // import 'package:dio/dio.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:json_annotation/json_annotation.dart';
// // // // import 'package:retrofit/retrofit.dart';
// 
// // // part 'fetch_example.g.dart';
// 
// // // @JsonSerializable()
// // // class Album {
// //   const Album({required this.userId, required this.id, required this.title});
// 
// //   final int userId;
// //   final int id;
// //   final String title;
// 
// //   factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
// //   Map<String, dynamic> toJson() => _$AlbumToJson(this);
// // // }
// 
// // // @RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
// // // abstract class AlbumApi {
// //   factory AlbumApi(Dio dio, {String? baseUrl}) = _AlbumApi;
// 
// //   @GET('/albums/{id}')
// //   Future<Album> getAlbum(@Path('id') int id);
// // // }
// 
// // // class FetchExample extends StatefulWidget {
// //   const FetchExample({super.key});
// 
// //   @override
// //   State<FetchExample> createState() => _FetchExampleState();
// // // }
// 
// // // class _FetchExampleState extends State<FetchExample> {
// //   late final AlbumApi _api;
// //   late Future<Album> _futureAlbum;
// 
// //   @override
// //   void initState() {
// //     super.initState();
// //     final dio = Dio();
// //     _api = AlbumApi(dio);
// //     _futureAlbum = _api.getAlbum(1);
// //   }
// 
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Dio + Retrofit GET Example')),
// //       body: Center(
// //         child: FutureBuilder<Album>(
// //           future: _futureAlbum,
// //           builder: (context, snapshot) {
// //             if (snapshot.connectionState == ConnectionState.waiting) {
// //               return const CircularProgressIndicator();
// //             }
// //             if (snapshot.hasError) {
// //               return Text('Error: ${snapshot.error}');
// //             }
// //             if (snapshot.hasData) {
// //               final album = snapshot.data!;
// //               return Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Text('Album ID: ${album.id}'),
// //                   const SizedBox(height: 8),
// //                   Text('Title: ${album.title}'),
// //                 ],
// //               );
// //             }
// //             return const Text('No data');
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // // }
