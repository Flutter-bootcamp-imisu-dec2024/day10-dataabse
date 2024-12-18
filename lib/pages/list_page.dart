import 'package:day10_database/constants/spacing.dart';
import 'package:day10_database/services/database.dart';
import 'package:day10_database/widgets/card_widget.dart';
import 'package:day10_database/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => ListPageState();
}

class ListPageState extends State<ListPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController salaryController = TextEditingController();

  void clearData() {
    nameController.clear();
    ageController.clear();
    salaryController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent.shade200,
      ),
      body: FutureBuilder(
        future: Database().getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var item = snapshot.data![index];
                return CardWidget(
                  age: item.age,
                  id: item.id,
                  name: item.name,
                  salary: item.salary,
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: Text("Error"),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton( //! it is inside scaffold not body !!
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFieldWidget(controller: nameController, text: "name"),
                      height24,
                      TextFieldWidget(controller: ageController, text: "age"),
                      height24,
                      TextFieldWidget(
                          controller: salaryController, text: "salary"),
                      height24,
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            await Database().insertNewStudent(
                                name: nameController.text,
                                age: int.parse(ageController.text),
                                salary: double.parse(salaryController.text));
                            if (context.mounted) {
                              clearData();
                              setState(() {});
                              Navigator.pop(context);
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.toString()),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade100,
                        ),
                        child: const Text(
                          "insert",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
