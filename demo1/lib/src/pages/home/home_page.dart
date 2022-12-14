import 'package:demo1/src/app.dart';
import 'package:demo1/src/bloc/home/home_bloc.dart';
import 'package:demo1/src/bloc/login/login_bloc.dart';
import 'package:demo1/src/constants/network_api.dart';
import 'package:demo1/src/models/product.dart';
import 'package:demo1/src/pages/app_routes.dart';
import 'package:demo1/src/pages/home/widgets/product_item.dart';
import 'package:demo1/src/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('HomePage'),
        actions: [
          IconButton(
            onPressed: () => context.read<HomeBloc>().add(HomeEvent_toggleDisplay()),
            icon: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return state.isGrid ? Icon(Icons.grid_3x3) : Icon(Icons.list);
              },
            ),
          )
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final products = state.products;
          return state.isGrid ? _buildGridView(products) : _buildListView(products);
        },
      ),
    );
  }

  _buildListView(List<Product> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) => SizedBox(
        height: 350,
        child: ProductItem(
          product: products[index],
          onTap: () => _navigatorManagementPage(products[index]),
          isGrid: false,
        ),
      ),
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
      itemBuilder: (context, index) => ProductItem(
        product: products[index],
        onTap: () => _navigatorManagementPage(products[index]),
        isGrid: true,
      ),
    );
  }

  void _navigatorManagementPage(Product? product) {
    Navigator.pushNamed(context, AppRoute.management, arguments: product).then((value) {
      context.read<HomeBloc>().add(HomeEvent_Fetch());
    });
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

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  void _showDialogBarcode(context) {
    // showDialog<void>(
    //   context: context,
    //   barrierDismissible: true,
    //   builder: (BuildContext dialogContext) => const DialogBarcodeImage(
    //     'www.codemobiles.com',
    //   ),
    // );
  }

  void _showDialogQRImage(context) {
    // showDialog<void>(
    //   context: context,
    //   barrierDismissible: true,
    //   builder: (BuildContext dialogContext) => const DialogQRImage(
    //     'www.codemobiles.com',
    //     image: Asset.pinBikerImage,
    //   ),
    // );
  }

  void _showScanQRCode(context) {
    // showDialog<void>(
    //   context: context,
    //   barrierDismissible: true,
    //   builder: (BuildContext dialogContext) => DialogScanQRCode(),
    // );
  }

  _showDemoDialog() {
    showDialog(
        barrierDismissible: false,
        context: navigatorState.currentContext!,
        builder: (context) {
          return Dialog(
              child: Container(
            height: 300,
            color: Colors.white,
            child: Column(
              children: [
                Text("My Dialog"),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Close"))
              ],
            ),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _buildProfile(),
          ListTile(
            leading: Icon(Icons.add),
            title: Text("Menu1"),
            onTap: () => _showDemoDialog(),
          ),
          ListTile(
            onTap: () => _showDialogBarcode(context),
            title: Text("BarCode"),
            leading: const FaIcon(FontAwesomeIcons.barcode, color: Colors.deepOrange),
          ),
          ListTile(
            onTap: () => _showDialogQRImage(context),
            title: Text("QRCode"),
            leading: Icon(Icons.qr_code, color: Colors.green),
          ),
          ListTile(
            onTap: () => _showScanQRCode(context),
            title: Text("Scanner"),
            leading: const Icon(Icons.qr_code_scanner, color: Colors.blueGrey),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, AppRoute.map),
            title: Text("Map"),
            leading: Icon(Icons.map_outlined, color: Colors.blue),
          ),
          Spacer(),
          _buildLogoutButton(),
        ],
      ),
    );
  }

  UserAccountsDrawerHeader _buildProfile() => UserAccountsDrawerHeader(
        currentAccountPicture: Container(
          child: const CircleAvatar(
            backgroundImage: NetworkImage('https://cdn-images-1.medium.com/max/280/1*X5PBTDQQ2Csztg3a6wofIQ@2x.png'),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
        accountName: Text('CMDev'),
        accountEmail: Text('support@codemobiles.com'),
      );

  Builder _buildLogoutButton() => Builder(
        builder: (context) => SafeArea(
          child: ListTile(leading: FaIcon(FontAwesomeIcons.signOutAlt), title: Text('Log out'), onTap: () => context.read<LoginBloc>().add(LoginEvent_Logout())),
        ),
      );
}
