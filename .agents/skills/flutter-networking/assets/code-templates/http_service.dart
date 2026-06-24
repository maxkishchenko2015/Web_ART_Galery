// // // // import 'package:dio/dio.dart';
// // // // import 'package:retrofit/retrofit.dart';
// 
// // // part 'http_service.g.dart';
// 
// // // @RestApi()
// // // abstract class ApiService {
// //   factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;
// 
// //   @GET('/items/{id}')
// //   Future<ItemDto> getItem(@Path('id') String id);
// 
// //   @GET('/items')
// //   Future<List<ItemDto>> getItems();
// 
// //   @POST('/items')
// //   Future<ItemDto> createItem(@Body() CreateItemRequest body);
// 
// //   @PUT('/items/{id}')
// //   Future<ItemDto> updateItem(@Path('id') String id, @Body() UpdateItemRequest body);
// 
// //   @DELETE('/items/{id}')
// //   Future<void> deleteItem(@Path('id') String id);
// // // }
// 
// // // class DioFactory {
// //   DioFactory({required this.baseUrl, this.tokenProvider});
// 
// //   final String baseUrl;
// //   final Future<String?> Function()? tokenProvider;
// 
// //   Dio create() {
// //     final dio = Dio(
// //       BaseOptions(
// //         baseUrl: baseUrl,
// //         connectTimeout: const Duration(seconds: 10),
// //         receiveTimeout: const Duration(seconds: 10),
// //         sendTimeout: const Duration(seconds: 10),
// //         headers: const {'Accept': 'application/json'},
// //       ),
// //     );
// 
// //     dio.interceptors.add(_AuthInterceptor(tokenProvider));
// //     dio.interceptors.add(_ErrorMappingInterceptor());
// 
// //     return dio;
// //   }
// // // }
// 
// // // class _AuthInterceptor extends QueuedInterceptor {
// //   _AuthInterceptor(this._tokenProvider);
// 
// //   final Future<String?> Function()? _tokenProvider;
// 
// //   @override
// //   Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
// //     final token = await _tokenProvider?.call();
// //     if (token != null && token.isNotEmpty) {
// //       options.headers['Authorization'] = 'Bearer $token';
// //     }
// //     handler.next(options);
// //   }
// // // }
// 
// // // class _ErrorMappingInterceptor extends Interceptor {
// //   @override
// //   void onError(DioException err, ErrorInterceptorHandler handler) {
// //     switch (err.type) {
// //       case DioExceptionType.connectionTimeout:
// //       case DioExceptionType.sendTimeout:
// //       case DioExceptionType.receiveTimeout:
// //         handler.reject(err.copyWith(error: RequestTimeoutException('Request timed out')));
// //         return;
// //       case DioExceptionType.badResponse:
// //         final statusCode = err.response?.statusCode ?? -1;
// //         handler.reject(err.copyWith(error: ApiException(statusCode: statusCode)));
// //         return;
// //       default:
// //         handler.next(err);
// //     }
// //   }
// // // }
// 
// // // class ApiException implements Exception {
// //   ApiException({required this.statusCode, this.message});
// 
// //   final int statusCode;
// //   final String? message;
// // // }
// 
// // // class RequestTimeoutException implements Exception {
// //   RequestTimeoutException(this.message);
// 
// //   final String message;
// // // }
// 
// // // class ItemDto {
// //   const ItemDto({required this.id, required this.name});
// 
// //   final String id;
// //   final String name;
// // // }
// 
// // // class CreateItemRequest {
// //   const CreateItemRequest({required this.name});
// 
// //   final String name;
// // // }
// 
// // // class UpdateItemRequest {
// //   const UpdateItemRequest({required this.name});
// 
// //   final String name;
// // // }
