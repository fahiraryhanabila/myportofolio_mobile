import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class EducationFormPage extends StatefulWidget {
  const EducationFormPage({super.key});

  @override
  State<EducationFormPage> createState() => _EducationFormPageState();
}

class _EducationFormPageState extends State<EducationFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _startYearController = TextEditingController();
  final _endYearController = TextEditingController();

  String _institution = "";
  String? _level; // null = belum dipilih ("---------")
  String _description = "";
  bool _isOngoing = false;
  String _skills = "";
  String _imageUrl = "";

  final List<String> _levels = [
    'Elementary School',
    'Junior High School',
    'Senior High School',
    'Bachelor`s Degree',
  ];

  @override
  void dispose() {
    _startYearController.dispose();
    _endYearController.dispose();
    super.dispose();
  }

  InputDecoration _decoration(String hint) {
    return InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 6),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  String? _validateYear(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName tidak boleh kosong!";
    }
    final year = int.tryParse(value.trim());
    if (year == null || value.trim().length != 4) {
      return "$fieldName harus 4 digit angka!";
    }
    if (year < 1900 || year > 2100) {
      return "$fieldName harus antara 1900 dan 2100!";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Tambah Education Baru')),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nama institusi
              _label("Nama Institusi/Jenjang"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  maxLength: 100,
                  decoration: _decoration("Masukkan jenjang pendidikanmu"),
                  onChanged: (String? value) {
                    setState(() {
                      _institution = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Nama institusi tidak boleh kosong!";
                    }
                    if (value.trim().length > 100) {
                      return "Nama institusi maksimal 100 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // Jenjang pendidikan
              _label("Jenjang Pendidikan"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: DropdownButtonFormField<String>(
                  decoration: _decoration("---------"),
                  initialValue: _level,
                  items: _levels
                      .map(
                        (level) =>
                            DropdownMenuItem(value: level, child: Text(level)),
                      )
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _level = newValue;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Pilih jenjang pendidikan!";
                    }
                    return null;
                  },
                ),
              ),

              // Deskripsi
              _label("Deskripsi"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: _decoration("Ceritakan pengalaman pendidikanmu"),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // Msh berlangsung atau ga
              _label("Masih Berlangsung?"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text("Ya, pendidikan ini masih berlangsung"),
                  value: _isOngoing,
                  onChanged: (bool? value) {
                    setState(() {
                      _isOngoing = value ?? false;
                      if (_isOngoing) {
                        _endYearController.clear();
                      }
                    });
                  },
                ),
              ),

              // Tahun mulai
              _label("Tahun Mulai"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  controller: _startYearController,
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  decoration: _decoration("Masukkan tahun mulai pendidikan"),
                  validator: (String? value) =>
                      _validateYear(value, "Tahun mulai"),
                ),
              ),

              // Tahun selesai
              _label("Tahun Selesai"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  controller: _endYearController,
                  enabled: !_isOngoing,
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  decoration: _decoration(
                    _isOngoing
                        ? "Tidak perlu diisi (masih berlangsung)"
                        : "Masukkan tahun selesai pendidikan",
                  ),
                  validator: (String? value) {
                    if (_isOngoing) return null;
                    final error = _validateYear(value, "Tahun selesai");
                    if (error != null) return error;
                    final start = int.tryParse(
                      _startYearController.text.trim(),
                    );
                    final end = int.parse(value!.trim());
                    if (start != null && end < start) {
                      return "Tahun selesai tidak boleh sebelum tahun mulai!";
                    }
                    return null;
                  },
                ),
              ),

              // Skill
              _label("Skill (pisahkan dengan koma)"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  decoration: _decoration("Masukkan skills yang kamu dapatkan"),
                  onChanged: (String? value) {
                    setState(() {
                      _skills = value!;
                    });
                  },
                ),
              ),

              // URL gambar
              _label("URL Gambar"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  keyboardType: TextInputType.url,
                  decoration: _decoration(
                    "https://drive.google.com/thumbnail?id=...&sz=w1000",
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _imageUrl = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return null;
                    }
                    final uri = Uri.tryParse(value.trim());
                    final isDriveThumbnail =
                        uri != null &&
                        uri.scheme == 'https' &&
                        uri.host == 'drive.google.com' &&
                        uri.path == '/thumbnail' &&
                        (uri.queryParameters['id'] ?? '').isNotEmpty;
                    if (!isDriveThumbnail) {
                      return "Gunakan format: https://drive.google.com/thumbnail?id=FILE_ID&sz=w1000";
                    }
                    return null;
                  },
                ),
              ),

              // Tombol
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final skillList = _skills
                            .split(',')
                            .map((s) => s.trim())
                            .where((s) => s.isNotEmpty)
                            .join(', ');
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                'Education berhasil ditambahkan!',
                              ),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Institusi: ${_institution.trim()}'),
                                    Text('Jenjang: $_level'),
                                    Text('Deskripsi: ${_description.trim()}'),
                                    Text(
                                      'Masih Berlangsung: ${_isOngoing ? "Ya" : "Tidak"}',
                                    ),
                                    Text(
                                      'Tahun Mulai: ${_startYearController.text.trim()}',
                                    ),
                                    Text(
                                      'Tahun Selesai: ${_isOngoing ? "Sekarang" : _endYearController.text.trim()}',
                                    ),
                                    Text(
                                      'Skill: ${skillList.isEmpty ? "-" : skillList}',
                                    ),
                                    Text(
                                      'URL Gambar: ${_imageUrl.trim().isEmpty ? "-" : _imageUrl.trim()}',
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                    setState(() {
                                      _level = null;
                                      _isOngoing = false;
                                      _startYearController.clear();
                                      _endYearController.clear();
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Tambah Education",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
