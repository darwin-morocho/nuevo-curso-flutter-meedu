import 'package:complete_example/app/domain/repositories/account_repository.dart';
import 'package:complete_example/app/ui/pages/home/controller/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController() : super(HomeState.initialState) {
    load(1);
  }

  final ScrollController scrollController = ScrollController();

  final AccountRepository _account = Get.i.find();

  Future<void> load(int page) async {

    if (state.totalPages > 0 && state.totalPages < page) {
      return;
    }

    if (state.fetching) {
      return;
    }

    state = state.copyWith(
      fetching: true,
    );

    final result = await _account.getUsersPerPage(page);

    if (result != null) {
      state = state.copyWith(
        fetching: false,
        initialized: true,
        page: page,
        totalPages: result.totalPages,
        users: [
          ...(state.users ?? []),
          ...result.data,
        ],
      );
    } else {
      state = state.copyWith(
        fetching: false,
        initialized: true,
      );
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
