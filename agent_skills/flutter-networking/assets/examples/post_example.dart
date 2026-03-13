// // // // import 'package:dio/dio.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:json_annotation/json_annotation.dart';
// // // // import 'package:retrofit/retrofit.dart';
// 
// // // part 'post_example.g.dart';
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
// // // @JsonSerializable()
// // // class CreateAlbumRequest {
// //   const CreateAlbumRequest({required this.title});
// 
// //   final String title;
// 
// //   factory CreateAlbumRequest.fromJson(Map<String, dynamic> json) =>
// //       _$CreateAlbumRequestFromJson(json);
// //   Map<String, dynamic> toJson() => _$CreateAlbumRequestToJson(this);
// // // }
// 
// // // @RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
// // // abstract class AlbumApi {
// //   factory AlbumApi(Dio dio, {String? baseUrl}) = _AlbumApi;
// 
// //   @POST('/albums')
// //   Future<Album> createAlbum(@Body() CreateAlbumRequest request);
// // // }
// 
// // // class PostExample extends StatefulWidget {
// //   const PostExample({super.key});
// 
// //   @override
// //   State<PostExample> createState() => _PostExampleState();
// // // }
// 
// // // class _PostExampleState extends State<PostExample> {
// //   final TextEditingController _controller = TextEditingController();
// //   Future<Album>? _futureAlbum;
// //   late final AlbumApi _api;
// 
// //   @override
// //   void initState() {
// //     super.initState();
// //     _api = AlbumApi(Dio());
// //   }
// 
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Dio + Retrofit POST Example')),
// //       body: Padding(
// //         padding: const EdgeInsets.all(12),
// //         child: _futureAlbum == null ? _buildForm() : _buildResult(),
// //       ),
// //     );
// //   }
// 
// //   Widget _buildForm() {
// //     return Column(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children: [
// //         TextField(
// //           controller: _controller,
// //           decoration: const InputDecoration(hintText: 'Enter title'),
// //         ),
// //         const SizedBox(height: 12),
// //         ElevatedButton(
// //           onPressed: () {
// //             setState(() {
// //               _futureAlbum = _api.createAlbum(CreateAlbumRequest(title: _controller.text));
// //             });
// //           },
// //           child: const Text('Create Album'),
// //         ),
// //       ],
// //     );
// //   }
// 
// //   Widget _buildResult() {
// //     return FutureBuilder<Album>(
// //       future: _futureAlbum,
// //       builder: (context, snapshot) {
// //         if (snapshot.connectionState == ConnectionState.waiting) {
// //           return const Center(child: CircularProgressIndicator());
// //         }
// //         if (snapshot.hasError) {
// //           return Center(child: Text('Error: ${snapshot.error}'));
// //         }
// //         if (snapshot.hasData) {
// //           return Center(
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Text('Created Album ID: ${snapshot.data!.id}'),
// //                 const SizedBox(height: 8),
// //                 Text('Title: ${snapshot.data!.title}'),
// //               ],
// //             ),
// //           );
// //         }
// //         return const SizedBox.shrink();
// //       },
// //     );
// //   }
// // // }
