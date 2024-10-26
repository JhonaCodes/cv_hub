import 'package:cvhub/routes/routes.dart';
import 'package:cvhub/ui/widget/section_listtile_widget.dart';
import 'package:cvhub/ui/widget/text_value.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const _CustomDrawer(),
      appBar: AppBar(
        title: const Text("CV HUB"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: child,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: const SectionListTileWidget( title: "Agregar contacto" ),
                content: const TextFieldValue( hintText: 'Url del contacto' ),
                actions: [

                  TextButton(
                    onPressed: () => Routes.pop(context),
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),


                  OutlinedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll<Color>(Colors.green),
                      side: WidgetStatePropertyAll<BorderSide>(
                        BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Guardar',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),


                ],
              );
            },
          );
        },
      ),
    );
  }
}

class _CustomDrawer extends StatelessWidget {
  const _CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 170,
            width: double.infinity,
            color: Colors.blue,
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Datos de usuario"),
            onTap: () {
              Routes.push(context, Navigate.myProfile);
            },
          )
        ],
      ),
    );
  }
}
