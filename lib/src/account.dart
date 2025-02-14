import 'hdnode.dart';

/// BIP32 account with simple helper methods
class Account {
  final HDNode accountNode;

  int? currentChild = 0;

  Account(this.accountNode, [this.currentChild]);

  /// Returns address at the current position
  String? getCurrentAddress([legacyFormat = true]) {
    if (legacyFormat) {
      return accountNode.derive(currentChild!).toLegacyAddress();
    } else {
      return accountNode.derive(currentChild!).toCashAddress();
    }
  }

  /// moves the position forward and returns an address from the new position
  String? getNextAddress([legacyFormat = true]) {
    if (legacyFormat) {
      if (currentChild != null) {
        currentChild = currentChild! + 1;
        return accountNode.derive(currentChild!).toLegacyAddress();
      }
    } else {
      if (currentChild != null) {
        currentChild = currentChild! + 1;
        return accountNode.derive(currentChild!).toCashAddress();
      }
    }
  }
}
