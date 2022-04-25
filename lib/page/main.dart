import 'package:flutter/material.dart';
import 'package:startwar_app/service/starwars.service.dart';
import 'package:startwar_app/service/vehicle.model.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool loading = true;
  List<VehicleModel> vehicules = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    getList();
    super.initState();
  }

  Future<void> getList() async {
    showLoader(true);
    vehicules = await StarWarsService().getList();
    showLoader(false);
  }

  Future<void> search() async {
    showLoader(true);
    vehicules = await StarWarsService().search(controller.text);
    showLoader(false);
  }

  void showLoader(bool value) => setState(() {
        loading = value;
      });

  @override
  Widget build(BuildContext context) {
    var content = Padding(
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Flex(direction: Axis.horizontal, children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.07,
              child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintMaxLines: 1,
                    hintText: 'Buscar un modelo de vehiculo',
                    border: OutlineInputBorder(),
                  ))),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.20,
              height: MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(
                  onPressed: () => search(), child: Icon(Icons.search)))
        ]),
        SizedBox(height: 30),
        Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [Icon(Icons.list), Text('Resultados')]),
        Divider(),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: vehicules
                  .map((e) => Card(
                      child: ListTile(
                          title: Text(e.name), trailing: Text(e.model))))
                  .toList(),
            ),
          ),
        ),
      ]),
    );
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Wrap(children: [Icon(Icons.android), Text(' Star Wars')])),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(child: content, onRefresh: () => getList()),
    );
  }
}
