import 'package:flutter/material.dart';
import 'package:mvvm_example/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<UserViewModel>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model.add("kemal", "kemal@gmail.com",
              "https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg");
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: model.data.length,
            itemBuilder: (BuildContext context, int index) {
              var ref = model.data[index];
              return ListTile(
                title: Text(ref!.email.toString()),
                subtitle: Text(ref.firstName.toString()),
                trailing: ClipOval(
                    child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                    ref.avatar.toString(),
                    fit: BoxFit.cover,
                  ),
                )),
              );
            },
          ))
        ],
      ),
    );
  }
}
