part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

abstract class PostsActionState extends PostsState {}

class PostsInitial extends PostsState {}

class PostsFetchingLoadingState extends PostsState {}

class PostsFetchingErrorState extends PostsState {}

class PostFetchingSuccessfulState extends PostsState {
  final List<PostDataUiModel> posts;
  PostFetchingSuccessfulState({
    required this.posts,
  });
}

class PostsAdditionSuccessState extends PostsActionState{}


class PostsAdditionErrorState extends PostsActionState{}

