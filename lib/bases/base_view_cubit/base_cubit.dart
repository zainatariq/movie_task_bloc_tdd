import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/util/error_dialog.dart';
import '../base_state/base_cubit_state.dart';

abstract class ICubit<G> extends Cubit<ICubitState<G>> {
  ICubit() : super(const ICubitState.initial());

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void emit(ICubitState<G> state) {
    if (isClosed) return;
    super.emit(state);
  }

  void _dismissDialog(Change<ICubitState<G>> change) {
    if (change.currentState == ICubitState<G>.loading()) {
      Navigator.of(navigatorKey.currentContext!, rootNavigator: true).pop();
      // Hide progress indicator logic if any
    }
  }

  void _resetState() {
    emit(const ICubitState.initial());
    Navigator.of(navigatorKey.currentContext!, rootNavigator: true).pop();
    // Hide progress indicator logic if any
  }

  @override
  void onChange(Change<ICubitState<G>> change) {
    super.onChange(change);
    change.nextState.whenOrNull(
      loading: () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          showDialog(
            context: navigatorKey.currentContext!,
            barrierDismissible: false,
            builder: (context) => const LoadingDialog(),
          );
        });
      },
      error: (err, msgList) {
        final context = navigatorKey.currentContext;
        _dismissDialog(change);
        if (context != null) {
          showDialog(
            context: context,
            builder: (context) => ErrorDialog(
              title: 'failed'.tr(context: context),
              message: msgList?.join(',') ?? '',
              resetState: _resetState,
            ),
          );
        }
      },
      initial: () {
        _dismissDialog(change);
      },
      success: (_) {
        _dismissDialog(change);
      },
    );
  }
}
