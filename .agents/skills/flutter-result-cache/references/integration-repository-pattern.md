# Integration: Result + BehaviorSubject Repository

This pattern gives you:

- Typed operation outcomes (`Result<V, E>`)
- Reactive local cache updates (`BehaviorSubject<T>`)

## Example

```dart
import 'package:rxdart/rxdart.dart';

class CouponRepository {
  CouponRepository(this._api);

  final CouponApi _api;
  final BehaviorSubject<Coupon?> _couponSubject = BehaviorSubject<Coupon?>.seeded(null);

  ValueStream<Coupon?> get couponStream => _couponSubject.stream;

  Future<Result<Coupon, CouponError>> loadCoupon() async {
    try {
      final coupon = await _api.fetchCoupon();
      _couponSubject.add(coupon);
      return Result.success(coupon);
    } on TimeoutException {
      return const Result.failure(CouponError.timeout);
    } on UnauthorizedException {
      return const Result.failure(CouponError.unauthorized);
    } catch (_) {
      return const Result.failure(CouponError.unknown);
    }
  }

  Future<Result<Coupon, CouponError>> getCouponPreferCache() async {
    final cached = _couponSubject.valueOrNull;
    if (cached != null) {
      return Result.success(cached);
    }
    return loadCoupon();
  }

  void dispose() {
    _couponSubject.close();
  }
}

enum CouponError { timeout, unauthorized, unknown }
```

## Why this works well with Bloc/Cubit

- Cubit can call `getCouponPreferCache()` for fast-first UX.
- Bloc can listen to `couponStream` for reactive updates.
- UI receives domain-friendly error types instead of raw exceptions.
