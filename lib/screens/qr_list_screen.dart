import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_code_app/Utilities/local_storage_utility.dart';
import 'package:qr_code_app/screens/qr_details_screen.dart';
import 'package:qr_code_app/widgets/add_qr_floating_button.dart';
import 'package:qr_code_app/widgets/styled_main_tile.dart';

class QrListScreen extends StatefulWidget {
  @override
  _QrListScreenState createState() => _QrListScreenState();
}

class _QrListScreenState extends State<QrListScreen> {
  List<dynamic> items = [];

  @override
  void initState() {
    super.initState();
    _loadQrData();
  }

  Future<void> _loadQrData() async {
    final directory = await getApplicationDocumentsDirectory();
    items= await LocalStorageUtility.loadQrData('${directory.path}/form_data.json');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 36),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.9,
            crossAxisSpacing: 26,
            mainAxisSpacing: 26,
          ),
          itemCount: items.length + 1,
          itemBuilder: (context, index) {
            return index == items.length
                ? StyledMainTile(
                    mainColor: Color(0xff111111),
                    secondaryColor: Colors.black,
                    text: "ADD QR CODE",
                    imagePath: "assets/add.png",
                    onPressed: () {
                      Navigator.pushNamed(context, "/form").then((_) {
                        _loadQrData(); // Reload data after returning from form
                      });
                    },
                  )
                : StyledMainTile(
                    mainColor: Color(0xffE4E4E4),
                    secondaryColor: Color(0xff313131),
                    text: items[index]["name"], // Using the "name" field from form
                    imagePath: items[index]["imagePath"].isNotEmpty
                        ? items[index]["imagePath"] // Use custom image path if provided
                        : "assets/qr_code.png",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QrDetailsScreen(
                            imagePath: items[index]["imagePath"],
                            name: items[index]["name"],
                            url: items[index]["url"],
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
      floatingActionButton: Transform.translate(
        offset: Offset(-20, -20),
        child: AddQrFloatingButton(onPressed: () {
          Navigator.pushNamed(context, '/form').then((_) {
            _loadQrData();
          });
        },)
      ),
    );
  }
}