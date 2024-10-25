import 'package:cvhub/ui/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';


class StandardCV1 extends StatelessWidget {
  const StandardCV1({super.key});



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Juan Pérez", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),),
                  Text("Desarrollador Web Full Stack", style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white), ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      CustomElevatedButton(
                        label: "Descargar CV",
                        icon:  const Icon(Icons.download, size: 20,),
                        onTap: (){

                        },
                      ),
                      SizedBox(width: 10,),

                      CustomElevatedButton(
                        label: "Contactar",
                        icon: const Icon(Icons.email, size: 20,),
                        onTap: (){

                        },
                      ),

                    ],
                  )
                ],
              ),
              const CircleAvatar(
                minRadius: 50,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20), // Espacio entre el CV y el botón
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/standard_cv'); // Navega a nueva cv
          },
          child: const Text("CV ANDRES"), // Texto del botón
        ),
      ],
    );
  }
}





