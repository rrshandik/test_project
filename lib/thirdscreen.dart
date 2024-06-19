import 'package:flutter/material.dart';
import 'package:flutter_suit_question1_dika/provider/getuser_api.dart';

class third_screen extends StatefulWidget {
  const third_screen({super.key});

  @override
  State<third_screen> createState() => _third_screenState();
}

class _third_screenState extends State<third_screen> {
  List users = [];
  int currentPage = 1;
  bool isLoadingMore = false;
  bool hasMoreData = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    tampilkanUser();
    _scrollController.addListener(_scrollListener);
  }

  Future<void> tampilkanUser({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
      hasMoreData = true;
      users.clear();
    }

    final newUsers = await ApiService.tampilkanUser(currentPage, 10);
    setState(() {
      if (newUsers.isNotEmpty) {
        users.addAll(newUsers);
        currentPage++;
      } else {
        hasMoreData = false;
      }
    });
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !isLoadingMore) {
      if (hasMoreData) {
        setState(() {
          isLoadingMore = true;
        });
        tampilkanUser().then((x) {
          setState(() {
            isLoadingMore = false;
          });
        });
      }
    }
  }

  Future<void> _refresh() async {
    await tampilkanUser(isRefresh: true);
  }

  void selectUser(String result) {
    Navigator.pop(context, result);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Screen'),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: users.length + (isLoadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == users.length) {
              return Center(child: CircularProgressIndicator());
            }
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(users[index]['avatar']),
              ),
              title: Text(users[index]['first_name'] + ' ' + users[index]['last_name']),
              subtitle: Text(users[index]['email']),
              onTap: () => selectUser(users[index]['first_name'] + ' ' + users[index]['last_name']),
            );
          },
        ),
      ),
    );
  }
}
