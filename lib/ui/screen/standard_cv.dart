import 'package:cvhub/infrastructure/api_service.dart';
import 'package:cvhub/model/cv_serializer.dart';
import 'package:cvhub/repository/cv_repository.dart';
import 'package:cvhub/ui/widget/custom_pill.dart';
import 'package:cvhub/ui/widget/section_listtile_widget.dart';
import 'package:flutter/material.dart';
import 'package:cvhub/ui/widget/custom_elevated_button.dart';

class StandardCV extends StatelessWidget {
  const StandardCV({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.sizeOf(context);

    return FutureBuilder(
      future: CVRepository.userData(),
      builder: (context, asyncSnapshot){

        if(asyncSnapshot.hasData){
          final CvSerializer? userData = asyncSnapshot.data;

          return userData != null ? SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: size.width <= 450 ? size.width : size.width * 0.8,
                  minWidth: 200,
              ),
              child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Section (Already implemented)
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
                              Text(
                                userData.personalInfo.name,
                                style: Theme.of(context).textTheme
                                    .titleLarge
                                    ?.copyWith(color: Colors.white),
                              ),
                              Text(
                                userData.personalInfo.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(color: Colors.white),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomElevatedButton(
                                    label: "Descargar CV",
                                    icon: const Icon(Icons.download, size: 20),
                                    onTap: () {},
                                  ),
                                  const SizedBox(width: 10),
                                  CustomElevatedButton(
                                    label: "Contactar",
                                    icon: const Icon(Icons.email, size: 20),
                                    onTap: () {},
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

                    // Contact Information
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _ContactItem(
                            icon: Icons.email,
                            text: userData.personalInfo.email,
                          ),
                          _ContactItem(
                            icon: Icons.phone,
                            text: userData.personalInfo.phone,
                          ),
                          _ContactItem(
                            icon: Icons.location_on,
                            text: userData.personalInfo.location.country,
                          ),
                        ],
                      ),
                    ),

                    // Professional Summary
                    SectionListTileWidget(
                      title: "Perfil Profesional",
                      content: userData.professionalProfile.summary,
                    ),

                    SectionListTileWidget(
                        title: "Experiencia Laboral",
                        subTitle: "Tech Solutions Inc.",
                        subtitleContent: "Desarrollador Senior",
                        subTitleTrailing: "2020 - Presente",
                        contentList: [
                          "Lideré un equipo de 5 desarrolladores",
                          "Incrementé la eficiencia del proceso en un 40% iwuehgf iweugfwhe fuwyegfuw",
                          "Implementé CI/CD reduciendo tiempos de despliegue",
                        ],
                    ),

                    SectionListTileWidget(
                      title: "Educación",
                      subTitle: "Universidad Técnica",
                      subTitleTrailing: "2012 - 2016",
                      subtitleContent: "Ingeniería en Sistemas",
                    ),
                    SectionListTileWidget(
                      title: "Habilidades",
                      subTitle: "Técnicas",
                      pillSections: userData.skills.technical,
                    ),

                    //_SectionTitle(title: "Habilidades"),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       const Text(
                    //         "Técnicas",
                    //         style: TextStyle(fontWeight: FontWeight.bold),
                    //       ),
                    //       Wrap(
                    //         spacing: 8,
                    //         runSpacing: 8,
                    //         children: [
                    //           "JavaScript",
                    //           "React",
                    //           "Node.js",
                    //           "Python",
                    //           "AWS",
                    //           "Docker"
                    //         ].map((skill) => _SkillChip(skill)).toList(),
                    //       ),
                    //       const SizedBox(height: 16),
                    //       const Text(
                    //         "Blandas",
                    //         style: TextStyle(fontWeight: FontWeight.bold),
                    //       ),
                    //       Wrap(
                    //         spacing: 8,
                    //         runSpacing: 8,
                    //         children: [
                    //           "Liderazgo",
                    //           "Comunicación",
                    //           "Trabajo en equipo",
                    //           "Resolución de problemas"
                    //         ].map((skill) => _SkillChip(skill)).toList(),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ) : Text("User is null");
        }



        if(asyncSnapshot.hasError) return Text("Error");

        return CircularProgressIndicator();
      },
    );


  }
}

// Helper Widgets
class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ContactItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Colors.blue),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final String company;
  final String position;
  final String period;
  final List<String> achievements;

  const _ExperienceItem({
    required this.company,
    required this.position,
    required this.period,
    required this.achievements,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                company,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(period),
            ],
          ),
          Text(
            position,
            style: TextStyle(color: Colors.blue[700]),
          ),
          const SizedBox(height: 8),
          ...achievements.map(
            (achievement) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("• "),
                  Expanded(child: Text(achievement)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EducationItem extends StatelessWidget {
  final String institution;
  final String degree;
  final String period;

  const _EducationItem({
    required this.institution,
    required this.degree,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                institution,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(period),
            ],
          ),
          Text(
            degree,
            style: TextStyle(color: Colors.blue[700]),
          ),
        ],
      ),
    );
  }
}
