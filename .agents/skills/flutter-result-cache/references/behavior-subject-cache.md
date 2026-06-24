# BehaviorSubject as Local Cache

Use `BehaviorSubject<T>` when you need a reactive cache that always exposes the latest value to new subscribers.

## Dependency

```yaml
dependencies:
  rxdart: ^0.28.0
```

## Basic Subject

```dart
import 'package:rxdart/rxdart.dart';

final BehaviorSubject<T> couponEventSubject = BehaviorSubject<T>();
```

## Single-Value Repository Cache

```dart
class CouponRepository {
  CouponRepository(this._api);

  final CouponApi _api;

  final BehaviorSubject<Coupon?> couponEventSubject = BehaviorSubject<Coupon?>.seeded(null);

  ValueStream<Coupon?> get couponStream => couponEventSubject.stream;

  Future<void> refresh() async {
    final coupon = await _api.fetchCoupon();
    couponEventSubject.add(coupon);
  }

  void dispose() {
    couponEventSubject.close();
  }
}
```

## Keyed In-Memory Cache with Subject

```dart
class ProductCacheRepository {
  ProductCacheRepository(this._api);

  final ProductApi _api;
  final Map<String, Product> _cache = <String, Product>{};

  final BehaviorSubject<Map<String, Product>> _subject =
      BehaviorSubject<Map<String, Product>>.seeded(const <String, Product>{});

  ValueStream<Map<String, Product>> get stream => _subject.stream;

  Future<Product> getById(String id) async {
    final cached = _cache[id];
    if (cached != null) return cached;

    final fresh = await _api.fetchProduct(id);
    _cache[id] = fresh;
    _subject.add(Map<String, Product>.unmodifiable(_cache));
    return fresh;
  }

  Future<void> invalidate(String id) async {
    _cache.remove(id);
    _subject.add(Map<String, Product>.unmodifiable(_cache));
  }

  void dispose() {
    _subject.close();
  }
}
```

## Practical Notes

- Seed when you need an immediate initial value.
- Expose `ValueStream<T>` to consumers, keep subject private when possible.
- Always call `close()` to avoid leaks.
- Avoid mutating emitted collections after `add`.
