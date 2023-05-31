part of 'posts_bloc.dart';

@immutable
abstract class PostsEvent {}


class PostsInitialFetchEvent extends PostsEvent{}


class PostAddEvent extends PostsEvent{}