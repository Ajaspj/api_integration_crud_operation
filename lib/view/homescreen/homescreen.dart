import 'package:api_integration_crud_operation/controll/homescreencontroller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<HomeScreenController>().getEmployee();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Provider = context.watch<HomeScreenController>();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(onPressed: () {}, child: Text("edit")),
                    TextButton(onPressed: () {}, child: Text("delete")),
                  ],
                ),
                Center(
                  child: ListView.separated(
                    itemCount: Provider.employeeslist?.length ?? 0,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ListTile(
                        title: Text(Provider.employeeslist?[index].name ?? ""),
                        tileColor: Colors.brown,
                        subtitle:
                            Text(Provider.employeeslist?[index].role ?? ""),
                        trailing: IconButton(
                            onPressed: () async {
                              await context
                                  .read<HomeScreenController>()
                                  .Deleteemployee(
                                      Provider.employeeslist?[index].id ?? "");
                            },
                            icon: Icon(Icons.delete))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
