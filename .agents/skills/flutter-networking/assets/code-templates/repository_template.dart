// // // import 'dart:async';
// 
// // // abstract class Identifiable {
// //   String get id;
// // // }
// 
// // // abstract class Repository<T extends Identifiable> {
// //   Future<T?> getById(String id);
// //   Future<List<T>> getAll();
// //   Future<T> create(T entity);
// //   Future<T> update(T entity);
// //   Future<void> delete(String id);
// // // }
// 
// // // abstract class CacheStore<T extends Identifiable> {
// //   Future<T?> read(String id);
// //   Future<List<T>> readAll();
// //   Future<void> write(T entity);
// //   Future<void> remove(String id);
// //   Future<void> clear();
// // // }
// 
// // // abstract class NetworkDataSource<T extends Identifiable> {
// //   Future<T?> fetchById(String id);
// //   Future<List<T>> fetchAll();
// //   Future<T> create(T entity);
// //   Future<T> update(T entity);
// //   Future<void> delete(String id);
// // // }
// 
// // // class HybridRepository<T extends Identifiable> implements Repository<T> {
// //   HybridRepository({required CacheStore<T> cache, required NetworkDataSource<T> network})
// //     : _cache = cache,
// //       _network = network;
// 
// //   final CacheStore<T> _cache;
// //   final NetworkDataSource<T> _network;
// 
// //   @override
// //   Future<T?> getById(String id) async {
// //     final cached = await _cache.read(id);
// //     if (cached != null) return cached;
// 
// //     final fresh = await _network.fetchById(id);
// //     if (fresh != null) {
// //       await _cache.write(fresh);
// //     }
// //     return fresh;
// //   }
// 
// //   @override
// //   Future<List<T>> getAll() async {
// //     final cached = await _cache.readAll();
// //     if (cached.isNotEmpty) return cached;
// 
// //     final fresh = await _network.fetchAll();
// //     for (final entity in fresh) {
// //       await _cache.write(entity);
// //     }
// //     return fresh;
// //   }
// 
// //   @override
// //   Future<T> create(T entity) async {
// //     final created = await _network.create(entity);
// //     await _cache.write(created);
// //     return created;
// //   }
// 
// //   @override
// //   Future<T> update(T entity) async {
// //     final updated = await _network.update(entity);
// //     await _cache.write(updated);
// //     return updated;
// //   }
// 
// //   @override
// //   Future<void> delete(String id) async {
// //     await _network.delete(id);
// //     await _cache.remove(id);
// //   }
// // // }
// 
// // // // Example network data source backed by Retrofit-generated API service.
// // // class RetrofitNetworkDataSource<T extends Identifiable> implements NetworkDataSource<T> {
// //   RetrofitNetworkDataSource({
// //     required Future<T?> Function(String id) fetchById,
// //     required Future<List<T>> Function() fetchAll,
// //     required Future<T> Function(T entity) create,
// //     required Future<T> Function(T entity) update,
// //     required Future<void> Function(String id) delete,
// //   }) : _fetchById = fetchById,
// //        _fetchAll = fetchAll,
// //        _create = create,
// //        _update = update,
// //        _delete = delete;
// 
// //   final Future<T?> Function(String id) _fetchById;
// //   final Future<List<T>> Function() _fetchAll;
// //   final Future<T> Function(T entity) _create;
// //   final Future<T> Function(T entity) _update;
// //   final Future<void> Function(String id) _delete;
// 
// //   @override
// //   Future<T?> fetchById(String id) => _fetchById(id);
// 
// //   @override
// //   Future<List<T>> fetchAll() => _fetchAll();
// 
// //   @override
// //   Future<T> create(T entity) => _create(entity);
// 
// //   @override
// //   Future<T> update(T entity) => _update(entity);
// 
// //   @override
// //   Future<void> delete(String id) => _delete(id);
// // // }
