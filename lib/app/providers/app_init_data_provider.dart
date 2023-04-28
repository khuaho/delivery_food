import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'app_latest_purchase_provider.dart';

final appInitDataProvider = FutureProvider((ref) async {
  await Future.wait([
    // ref.watch(appLatestSubscriptionProvider.future),
    Future.delayed(const Duration(milliseconds: 320)),
  ]);
});
