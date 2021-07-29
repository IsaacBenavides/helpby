class Chat {
  final String name;
  final List<String> specialty;

  Chat(this.name, this.specialty);
}

final chatToDoctor = <Chat>[
  Chat('Dr. Dimitri Petrenko', ['Dentista']),
  Chat('Dr. Zackary Hailarious', ['Ortopedista', 'Cirujano', 'Dentista']),
  Chat('Dr. Dimitri Petrenko', ['Endocrino', 'Orthopedist']),
  Chat('Dr. Dimitri Petrenko', ['Dentista']),
  Chat('Dr. Dimitri Petrenko', ['Ortopedista', 'Cirujano', 'Dentista']),
  Chat('Dr. Dimitri Petrenko', ['Endocrino', 'Orthopedist']),
];
