// // // // import 'package:dio/dio.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:json_annotation/json_annotation.dart';
// // // // import 'package:retrofit/retrofit.dart';
// 
// // // part 'background_parsing.g.dart';
// 
// // // @JsonSerializable()
// // // class Photo {
// //   const Photo({required this.id, required this.title, required this.thumbnailUrl});
// 
// //   final int id;
// //   final String title;
// //   final String thumbnailUrl;
// 
// //   factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
// //   Map<String, dynamic> toJson() => _$PhotoToJson(this);
// // // }
// 
// // // @RestApi(baseUrl: 'https://jsonplaceholder.typicode.com', parser: Parser.FlutterCompute)
// // // abstract class PhotoApi {
// //   factory PhotoApi(Dio dio, {String? baseUrl}) = _PhotoApi;
// 
// //   @GET('/photos')
// //   Future<List<Photo>> getPhotos();
// // // }
// 
// // // class BackgroundParsingExample extends StatefulWidget {
// //   const BackgroundParsingExample({super.key});
// 
// //   @override
// //   State<BackgroundParsingExample> createState() => _BackgroundParsingExampleState();
// // // }
// 
// // // class _BackgroundParsingExampleState extends State<BackgroundParsingExample> {
// //   late final PhotoApi _api;
// //   late Future<List<Photo>> _futurePhotos;
// 
// //   @override
// //   void initState() {
// //     super.initState();
// //     _api = PhotoApi(Dio());
// //     _futurePhotos = _api.getPhotos();
// //   }
// 
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Retrofit FlutterCompute Example'),
// //         actions: [
// //           IconButton(
// //             onPressed: () {
// //               setState(() {
// //                 _futurePhotos = _api.getPhotos();
// //               });
// //             },
// //             icon: const Icon(Icons.refresh),
// //           ),
// //         ],
// //       ),
// //       body: FutureBuilder<List<Photo>>(
// //         future: _futurePhotos,
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(child: CircularProgressIndicator());
// //           }
// //           if (snapshot.hasError) {
// //             return Center(child: Text('Error: ${snapshot.error}'));
// //           }
// //           final photos = snapshot.data ?? const <Photo>[];
// //           return ListView.builder(
// //             itemCount: photos.length,
// //             itemBuilder: (context, index) {
// //               final photo = photos[index];
// //               return ListTile(
// //                 leading: Image.network(photo.thumbnailUrl),
// //                 title: Text(photo.title),
// //                 subtitle: Text('#${photo.id}'),
// //               );
// //             },
// //           );
// //         },
// //       ),
// //     );
// //   }
// // // }
