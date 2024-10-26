import 'dart:convert';

class CvSerializer {
  final String version;
  final String templateCv;
  final ThemeUser theme;
  final PersonalInfo personalInfo;
  final ProfessionalProfile professionalProfile;
  final List<WorkExperience> workExperience;
  final List<Education> education;
  final Skills skills;
  final List<dynamic> languages;
  final List<dynamic> certifications;
  final List<dynamic> projects;
  final Metadata metadata;

  CvSerializer({
    required this.version,
    required this.templateCv,
    required this.theme,
    required this.personalInfo,
    required this.professionalProfile,
    required this.workExperience,
    required this.education,
    required this.skills,
    required this.languages,
    required this.certifications,
    required this.projects,
    required this.metadata,
  });

  CvSerializer copyWith({
    String? version,
    String? templateCv,
    ThemeUser? theme,
    PersonalInfo? personalInfo,
    ProfessionalProfile? professionalProfile,
    List<WorkExperience>? workExperience,
    List<Education>? education,
    Skills? skills,
    List<dynamic>? languages,
    List<dynamic>? certifications,
    List<dynamic>? projects,
    Metadata? metadata,
  }) =>
      CvSerializer(
        version: version ?? this.version,
        templateCv: templateCv ?? this.templateCv,
        theme: theme ?? this.theme,
        personalInfo: personalInfo ?? this.personalInfo,
        professionalProfile: professionalProfile ?? this.professionalProfile,
        workExperience: workExperience ?? this.workExperience,
        education: education ?? this.education,
        skills: skills ?? this.skills,
        languages: languages ?? this.languages,
        certifications: certifications ?? this.certifications,
        projects: projects ?? this.projects,
        metadata: metadata ?? this.metadata,
      );

  factory CvSerializer.fromRawJson(String str) => CvSerializer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CvSerializer.fromJson(Map<String, dynamic> json) => CvSerializer(
    version: json["version"],
    templateCv: json["template_cv"],
    theme: ThemeUser.fromJson(json["theme"]),
    personalInfo: PersonalInfo.fromJson(json["personal_info"]),
    professionalProfile: ProfessionalProfile.fromJson(json["professional_profile"]),
    workExperience: List<WorkExperience>.from(json["work_experience"].map((x) => WorkExperience.fromJson(x))),
    education: List<Education>.from(json["education"].map((x) => Education.fromJson(x))),
    skills: Skills.fromJson(json["skills"]),
    languages: List<dynamic>.from(json["languages"].map((x) => x)),
    certifications: List<dynamic>.from(json["certifications"].map((x) => x)),
    projects: List<dynamic>.from(json["projects"].map((x) => x)),
    metadata: Metadata.fromJson(json["metadata"]),
  );

  Map<String, dynamic> toJson() => {
    "version": version,
    "template_cv": templateCv,
    "theme": theme.toJson(),
    "personal_info": personalInfo.toJson(),
    "professional_profile": professionalProfile.toJson(),
    "work_experience": List<dynamic>.from(workExperience.map((x) => x.toJson())),
    "education": List<dynamic>.from(education.map((x) => x.toJson())),
    "skills": skills.toJson(),
    "languages": List<dynamic>.from(languages.map((x) => x)),
    "certifications": List<dynamic>.from(certifications.map((x) => x)),
    "projects": List<dynamic>.from(projects.map((x) => x)),
    "metadata": metadata.toJson(),
  };
}

class Education {
  final String institution;
  final String degree;
  final Period period;

  Education({
    required this.institution,
    required this.degree,
    required this.period,
  });

  Education copyWith({
    String? institution,
    String? degree,
    Period? period,
  }) =>
      Education(
        institution: institution ?? this.institution,
        degree: degree ?? this.degree,
        period: period ?? this.period,
      );

  factory Education.fromRawJson(String str) => Education.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Education.fromJson(Map<String, dynamic> json) => Education(
    institution: json["institution"],
    degree: json["degree"],
    period: Period.fromJson(json["period"]),
  );

  Map<String, dynamic> toJson() => {
    "institution": institution,
    "degree": degree,
    "period": period.toJson(),
  };
}

class Period {
  final String start;
  final String end;

  Period({
    required this.start,
    required this.end,
  });

  Period copyWith({
    String? start,
    String? end,
  }) =>
      Period(
        start: start ?? this.start,
        end: end ?? this.end,
      );

  factory Period.fromRawJson(String str) => Period.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Period.fromJson(Map<String, dynamic> json) => Period(
    start: json["start"],
    end: json["end"],
  );

  Map<String, dynamic> toJson() => {
    "start": start,
    "end": end,
  };
}

class Metadata {
  final DateTime lastUpdated;
  final String language;
  final String schemaVersion;

  Metadata({
    required this.lastUpdated,
    required this.language,
    required this.schemaVersion,
  });

  Metadata copyWith({
    DateTime? lastUpdated,
    String? language,
    String? schemaVersion,
  }) =>
      Metadata(
        lastUpdated: lastUpdated ?? this.lastUpdated,
        language: language ?? this.language,
        schemaVersion: schemaVersion ?? this.schemaVersion,
      );

  factory Metadata.fromRawJson(String str) => Metadata.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    lastUpdated: DateTime.parse(json["last_updated"]),
    language: json["language"],
    schemaVersion: json["schema_version"],
  );

  Map<String, dynamic> toJson() => {
    "last_updated": "${lastUpdated.year.toString().padLeft(4, '0')}-${lastUpdated.month.toString().padLeft(2, '0')}-${lastUpdated.day.toString().padLeft(2, '0')}",
    "language": language,
    "schema_version": schemaVersion,
  };
}

class PersonalInfo {
  final String name;
  final String title;
  final String email;
  final String phone;
  final Location location;
  final dynamic avatar;
  final Links links;

  PersonalInfo({
    required this.name,
    required this.title,
    required this.email,
    required this.phone,
    required this.location,
    required this.avatar,
    required this.links,
  });

  PersonalInfo copyWith({
    String? name,
    String? title,
    String? email,
    String? phone,
    Location? location,
    dynamic avatar,
    Links? links,
  }) =>
      PersonalInfo(
        name: name ?? this.name,
        title: title ?? this.title,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        location: location ?? this.location,
        avatar: avatar ?? this.avatar,
        links: links ?? this.links,
      );

  factory PersonalInfo.fromRawJson(String str) => PersonalInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PersonalInfo.fromJson(Map<String, dynamic> json) => PersonalInfo(
    name: json["name"],
    title: json["title"],
    email: json["email"],
    phone: json["phone"],
    location: Location.fromJson(json["location"]),
    avatar: json["avatar"],
    links: Links.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "title": title,
    "email": email,
    "phone": phone,
    "location": location.toJson(),
    "avatar": avatar,
    "links": links.toJson(),
  };
}

class Links {
  final String cvDownload;
  final String contact;

  Links({
    required this.cvDownload,
    required this.contact,
  });

  Links copyWith({
    String? cvDownload,
    String? contact,
  }) =>
      Links(
        cvDownload: cvDownload ?? this.cvDownload,
        contact: contact ?? this.contact,
      );

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    cvDownload: json["cv_download"],
    contact: json["contact"],
  );

  Map<String, dynamic> toJson() => {
    "cv_download": cvDownload,
    "contact": contact,
  };
}

class Location {
  final String city;
  final String country;

  Location({
    required this.city,
    required this.country,
  });

  Location copyWith({
    String? city,
    String? country,
  }) =>
      Location(
        city: city ?? this.city,
        country: country ?? this.country,
      );

  factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    city: json["city"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "country": country,
  };
}

class ProfessionalProfile {
  final String summary;

  ProfessionalProfile({
    required this.summary,
  });

  ProfessionalProfile copyWith({
    String? summary,
  }) =>
      ProfessionalProfile(
        summary: summary ?? this.summary,
      );

  factory ProfessionalProfile.fromRawJson(String str) => ProfessionalProfile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfessionalProfile.fromJson(Map<String, dynamic> json) => ProfessionalProfile(
    summary: json["summary"],
  );

  Map<String, dynamic> toJson() => {
    "summary": summary,
  };
}

class Skills {
  final List<String> technical;
  final List<String> soft;

  Skills({
    required this.technical,
    required this.soft,
  });

  Skills copyWith({
    List<String>? technical,
    List<String>? soft,
  }) =>
      Skills(
        technical: technical ?? this.technical,
        soft: soft ?? this.soft,
      );

  factory Skills.fromRawJson(String str) => Skills.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Skills.fromJson(Map<String, dynamic> json) => Skills(
    technical: List<String>.from(json["technical"].map((x) => x)),
    soft: List<String>.from(json["soft"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "technical": List<dynamic>.from(technical.map((x) => x)),
    "soft": List<dynamic>.from(soft.map((x) => x)),
  };
}

class ThemeUser {
  final String primaryColor;
  final String secondaryColor;
  final FontSize fontSize;
  final String fontFamily;

  ThemeUser({
    required this.primaryColor,
    required this.secondaryColor,
    required this.fontSize,
    required this.fontFamily,
  });

  ThemeUser copyWith({
    String? primaryColor,
    String? secondaryColor,
    FontSize? fontSize,
    String? fontFamily,
  }) =>
      ThemeUser(
        primaryColor: primaryColor ?? this.primaryColor,
        secondaryColor: secondaryColor ?? this.secondaryColor,
        fontSize: fontSize ?? this.fontSize,
        fontFamily: fontFamily ?? this.fontFamily,
      );

  factory ThemeUser.fromRawJson(String str) => ThemeUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ThemeUser.fromJson(Map<String, dynamic> json) => ThemeUser(
    primaryColor: json["primaryColor"],
    secondaryColor: json["secondaryColor"],
    fontSize: FontSize.fromJson(json["fontSize"]),
    fontFamily: json["fontFamily"],
  );

  Map<String, dynamic> toJson() => {
    "primaryColor": primaryColor,
    "secondaryColor": secondaryColor,
    "fontSize": fontSize.toJson(),
    "fontFamily": fontFamily,
  };
}

class FontSize {
  final String title;
  final String subtitle;
  final String body;

  FontSize({
    required this.title,
    required this.subtitle,
    required this.body,
  });

  FontSize copyWith({
    String? title,
    String? subtitle,
    String? body,
  }) =>
      FontSize(
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        body: body ?? this.body,
      );

  factory FontSize.fromRawJson(String str) => FontSize.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FontSize.fromJson(Map<String, dynamic> json) => FontSize(
    title: json["title"],
    subtitle: json["subtitle"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "body": body,
  };
}

class WorkExperience {
  final String company;
  final String position;
  final Period period;
  final List<String> achievements;

  WorkExperience({
    required this.company,
    required this.position,
    required this.period,
    required this.achievements,
  });

  WorkExperience copyWith({
    String? company,
    String? position,
    Period? period,
    List<String>? achievements,
  }) =>
      WorkExperience(
        company: company ?? this.company,
        position: position ?? this.position,
        period: period ?? this.period,
        achievements: achievements ?? this.achievements,
      );

  factory WorkExperience.fromRawJson(String str) => WorkExperience.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WorkExperience.fromJson(Map<String, dynamic> json) => WorkExperience(
    company: json["company"],
    position: json["position"],
    period: Period.fromJson(json["period"]),
    achievements: List<String>.from(json["achievements"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "company": company,
    "position": position,
    "period": period.toJson(),
    "achievements": List<dynamic>.from(achievements.map((x) => x)),
  };
}
