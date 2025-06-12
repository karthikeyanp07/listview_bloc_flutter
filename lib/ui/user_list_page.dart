import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../viewmodel/user_bloc.dart';
import '../viewmodel/user_event.dart';
import '../viewmodel/user_state.dart';

class UserListPage extends StatelessWidget
{
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: const Text("GitHub Users")),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state)
        {
          if (state is UserLoading)
          {
            return const Center(child: CircularProgressIndicator());
          }
          else if (state is UserLoaded)
          {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatarUrl),
                  ),
                  title: Text(user.login),
                  subtitle: Text("ID: ${user.id}"),
                );
              },
            );
          }
          else if (state is UserError)
          {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text("Press button to fetch users"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<UserBloc>().add(LoadUsers());
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}