import 'package:flutter/material.dart';
import 'package:mvvm_app/data/response/status.dart';
import 'package:mvvm_app/utilities/routes/routes_name.dart';
import 'package:mvvm_app/view_model/homeScreen_view_model.dart';
import 'package:mvvm_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel homeScreenViewModel = HomeScreenViewModel();
  @override
  void initState() {
    super.initState();
    homeScreenViewModel.fetchmoviesListApi();
  }

  @override
  Widget build(BuildContext context) {
    final userPrefernce = Provider.of<UserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text(
            'Home screen',
          ),
          actions: [
            InkWell(
              onTap: () {
                userPrefernce.remove().then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: const Center(
                child: Text(
                  'Logout',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      backgroundColor: Colors.transparent),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        body: ChangeNotifierProvider<HomeScreenViewModel>(
          create: (context) => homeScreenViewModel,
          child: Consumer<HomeScreenViewModel>(
            builder: (context, value, child) {
              switch (value.moviesList.status!) {
                case Status.LODING:
                  return const Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  return Center(
                      child: Text(
                    value.moviesList.message.toString(),
                    style: const TextStyle(fontSize: 30),
                  ));
                case Status.COMPLETED:
                  // return Text(data)
                  return ListView.builder(
                    itemCount: 50,
                    itemBuilder: (context, index) {
                      return Card(
                          child: ListTile(
                        title: Text(value.moviesList.data!.title.toString()),
                        subtitle: Text(value.moviesList.data!.id.toString()),
                        leading: Image.network(
                            value.moviesList.data!.thumbnailUrl.toString()),
                        trailing: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('234'),
                              Icon(Icons.star, color: Colors.yellow)
                            ]),
                      ));
                    },
                  );
                default:
                  return Container();
              }
            },
          ),
        ));
  }
}
//line 16: call model
//line 24: throught model go to remove fun created in model if user click on logout
//line 15,19: if you are not going to define your providermodel in main, define in req screen for run timr build
//line 54 initialize like in main
//line 56:simple use of consumer for viewing change in run time