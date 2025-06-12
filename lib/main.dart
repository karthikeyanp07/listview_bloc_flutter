import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listview_bloc_flutter/repository/user_repository.dart';
import 'package:listview_bloc_flutter/ui/user_list_page.dart';
import 'package:listview_bloc_flutter/viewmodel/user_bloc.dart';
import 'data/network/api_service.dart';

void main()
{
  final apiService = ApiService();
  final userRepository = UserRepository(apiService);
  runApp(MyApp(userRepository: userRepository));
}

class MyApp extends StatelessWidget
{
  final UserRepository userRepository;

  const MyApp({super.key, required this.userRepository});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'MVVM + Bloc + Dio Demo',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => UserBloc(userRepository),
        child: const UserListPage(),
      ),
    );
  }
}