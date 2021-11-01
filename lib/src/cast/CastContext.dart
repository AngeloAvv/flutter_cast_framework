import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../HostApis.dart';
import '../MethodNames.dart';
import 'SessionManager.dart';

class CastContext {
  final ValueNotifier<CastState> state = ValueNotifier(CastState.unavailable);
  final MethodChannel _channel;
  final CastApi castApi;

  CastContext(this._channel, this.castApi);

  void showCastChooserDialog() {
    _channel.invokeMethod(PlatformMethodNames.showCastDialog);
  }

  void onCastStateChanged(dynamic arguments) {
    int castState = arguments;
    state.value = CastState.values[castState];
  }

  SessionManager? _sessionManager;
  SessionManager get sessionManager {
    var result = _sessionManager;
    if (result == null) {
      _sessionManager = result = SessionManager(castApi);
    }
    return result;
  }
}

enum CastState {
  idle, // 0
  unavailable, // 1
  unconnected, // 2
  connecting, // 3
  connected, // 4
}
