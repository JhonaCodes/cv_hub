import 'package:flutter/material.dart';
import 'package:cvhub/ui/widget/custom_elevated_button.dart';

class StandardCV extends StatelessWidget {
  const StandardCV({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                      "Juan Pérez",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.white),
                    ),
                    Text(
                      "Desarrollador Web Full Stack",
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
                  text: "juan.perez@email.com",
                ),
                _ContactItem(
                  icon: Icons.phone,
                  text: "+1234567890",
                ),
                _ContactItem(
                  icon: Icons.location_on,
                  text: "Ciudad, País",
                ),
              ],
            ),
          ),

          // Professional Summary
          _SectionTitle(title: "Perfil Profesional"),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "Desarrollador Full Stack con más de 5 años de experiencia en desarrollo web. "
                  "Especializado en React, Node.js y tecnologías cloud. Apasionado por crear "
                  "soluciones escalables y liderar equipos técnicos.",
            ),
          ),

          // Experience
          _SectionTitle(title: "Experiencia Laboral"),
          _ExperienceItem(
            company: "Tech Solutions Inc.",
            position: "Desarrollador Senior",
            period: "2020 - Presente",
            achievements: [
              "Lideré un equipo de 5 desarrolladores",
              "Incrementé la eficiencia del proceso en un 40%",
              "Implementé CI/CD reduciendo tiempos de despliegue",
            ],
          ),

          // Education
          _SectionTitle(title: "Educación"),
          _EducationItem(
            institution: "Universidad Técnica",
            degree: "Ingeniería en Sistemas",
            period: "2012 - 2016",
          ),

          // Skills
          _SectionTitle(title: "Habilidades"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Técnicas",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    "JavaScript",
                    "React",
                    "Node.js",
                    "Python",
                    "AWS",
                    "Docker"
                  ].map((skill) => _SkillChip(skill)).toList(),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Blandas",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    "Liderazgo",
                    "Comunicación",
                    "Trabajo en equipo",
                    "Resolución de problemas"
                  ].map((skill) => _SkillChip(skill)).toList(),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
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

class _SkillChip extends StatelessWidget {
  final String label;

  const _SkillChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue[100]!),
      ),
      child: Text(
        label,
        style: TextStyle(color: Colors.blue[700], fontSize: 12),
      ),
    );
  }
}