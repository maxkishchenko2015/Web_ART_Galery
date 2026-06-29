import 'package:cloud_firestore/cloud_firestore.dart';

/// Runs a Firestore [op] and retries on transient failures with linear backoff.
///
/// On web, a momentary network blip (or Firestore briefly falling back from
/// WebChannel to long-polling) surfaces as `FirebaseException(unavailable)` —
/// "the client is offline". A one-shot `.get()` has no internal retry and
/// reports this straight to the user/telemetry, even though a second attempt
/// a few hundred ms later usually succeeds.
///
/// Only `unavailable` / `deadline-exceeded` are retried; permission, not-found
/// and other deterministic errors rethrow immediately. Defaults to 3 attempts
/// with 300ms, 600ms backoff.
Future<T> withFirestoreRetry<T>(
  Future<T> Function() op, {
  int maxAttempts = 3,
}) async {
  var attempt = 0;
  while (true) {
    attempt++;
    try {
      return await op();
    } on FirebaseException catch (e) {
      final transient = e.code == 'unavailable' || e.code == 'deadline-exceeded';
      if (!transient || attempt >= maxAttempts) {
        rethrow;
      }
      await Future<void>.delayed(Duration(milliseconds: 300 * attempt));
    }
  }
}
