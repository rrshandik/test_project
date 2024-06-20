import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  final List users;
  final bool hasMoreData;
  final bool isLoadingMore;
  final int currentPage;

  UserState({
    this.users = const [],
    this.hasMoreData = true,
    this.isLoadingMore = false,
    this.currentPage = 1,
  });

  UserState copyWith({
    List? users,
    bool? hasMoreData,
    bool? isLoadingMore,
    int? currentPage,
  }) {
    return UserState(
      users: users ?? this.users,
      hasMoreData: hasMoreData ?? this.hasMoreData,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      currentPage: currentPage ?? this.currentPage
    );
  }

  @override
  List<Object> get props => [users, hasMoreData, isLoadingMore, currentPage];
}