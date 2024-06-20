import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_suit_question1_dika/bloc/user_bloc.dart';
import 'package:flutter_suit_question1_dika/bloc/user_event.dart';
import 'package:flutter_suit_question1_dika/bloc/user_state.dart';




class third_screen extends StatelessWidget {
  const third_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(tampilkanUser()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Third Screen'),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state.users.isEmpty && state.isLoadingMore) {
              return Center(child: CircularProgressIndicator());
            }
            return RefreshIndicator(
              onRefresh: () async {
                context.read<UserBloc>().add(tampilkanUser(isRefresh: true));
              },
              child: ListView.builder(
                controller: ScrollController()
                  ..addListener(() {
                    if (context.read<UserBloc>().state.hasMoreData &&
                        context.read<UserBloc>().state.isLoadingMore == false &&
                        (context.read<UserBloc>().state.users.length % 10 == 0)) {
                      context.read<UserBloc>().add(tampilkanUser());
                    }
                  }),
                itemCount: state.users.length + (state.isLoadingMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == state.users.length) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(state.users[index]['avatar']),
                    ),
                    title: Text(state.users[index]['first_name'] + ' ' + state.users[index]['last_name']),
                    subtitle: Text(state.users[index]['email']),
                    onTap: () => Navigator.pop(
                        context, state.users[index]['first_name'] + ' ' + state.users[index]['last_name']),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
