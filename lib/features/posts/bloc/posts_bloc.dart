import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_with_apis/features/posts/models/post_data_ui_model.dart';
import 'package:flutter_bloc_with_apis/features/posts/repos/posts_repo.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
    on<PostAddEvent>(postAddEvent);
  }

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    emit(PostsFetchingLoadingState());
    List<PostDataUiModel> posts = await PostsRepo.fetchPosts();

    emit(PostFetchingSuccessfulState(posts: posts));
  }

  FutureOr<void> postAddEvent(
      PostAddEvent event, Emitter<PostsState> emit) async {
    bool success = await PostsRepo.addPost();
  
    if (success) {
      emit(PostsAdditionSuccessState());
    } else {
      emit(PostsAdditionErrorState());
    }
  }
}
