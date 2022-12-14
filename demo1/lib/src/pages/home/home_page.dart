import 'package:demo1/src/bloc/home/home_bloc.dart';
import 'package:demo1/src/bloc/login/login_bloc.dart';
import 'package:demo1/src/models/product.dart';
import 'package:demo1/src/pages/app_routes.dart';
import 'package:demo1/src/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeEvent_Fetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        actions: [
          IconButton(
            onPressed: () => context.read<LoginBloc>().add(LoginEvent_Logout()),
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final products = state.products;
          return _buildGridView(products);
        },
      ),
    );
  }

  _buildListView(List<Product> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) => Text(products[index].name),
    );
  }

  _buildGridView(List<Product> products) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        childAspectRatio: 0.9, // set height ratio -  (itemWidth / itemHeight)
      ),
      itemBuilder: (context, index) => Text(products[index].name),
    );
  }

  _buildDemoFutureBuilder() {
    return FutureBuilder(
      future: ApiService().feed(),
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          return SizedBox();
        }
        final products = snapshot.data!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [...products.map((e) => Text(e.name))],
        );
      },
    );
  }
}

class BlocCounter extends StatelessWidget {
  const BlocCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          IconButton(
            onPressed: () => context.read<HomeBloc>().add(HomeEventAdd()),
            icon: Icon(Icons.add),
          ),
          Text(context.read<HomeBloc>().state.count1.toString()),
          SizedBox(width: 20),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Text(state.count1.toString());
            },
          ),
          IconButton(
            onPressed: () => context.read<HomeBloc>().add(HomeEventRemove()),
            icon: Icon(Icons.remove),
          ),
          IconButton(
            onPressed: () => context.read<HomeBloc>().add(HomeEventReset()),
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
