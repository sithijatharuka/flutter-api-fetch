import 'package:flutter/material.dart';
import 'package:flutter_api/models/post_model.dart';
import 'package:flutter_api/api/post_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Api get request'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<List<PostModel>>(
              future: getData(),
              builder: (context, snapshot) {
                final postsData = snapshot.data;
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final posts = postsData![index];
                        return Card(
                          child: ListTile(
                            leading: Text(posts.id.toString()),
                            title: Text(posts.title),
                            subtitle: Text(posts.body),
                          ),
                        );
                      },
                      separatorBuilder: (_, index) => SizedBox(height: 10),
                      itemCount: postsData!.length,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                // By default, show a loading spinner.
                return Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
