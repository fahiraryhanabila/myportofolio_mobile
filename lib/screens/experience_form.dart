import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/models/experience.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:provider/provider.dart';

class ExperienceFormPage extends StatefulWidget {
  const ExperienceFormPage({super.key});

  @override
  State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

class _ExperienceFormPageState extends State<ExperienceFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();

  String _title = "";
  String _description = "";
  String _type = "full-time";
  String _imageUrl = "";
  DateTime? _endDate;
  bool _isSubmitting = false;

  // nilai API -> label tampilan
  final Map<String, String> _types = const {
    'full-time': 'Full-Time',
    'part-time': 'Part-Time',
    'internship': 'Internship',
    'freelance': 'Freelance',
    'volunteer': 'Volunteer',
    'research': 'Research',
  };

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  String _two(int n) => n.toString().padLeft(2, '0');

  String _formatDate(DateTime d) => "${d.year}-${_two(d.month)}-${_two(d.day)}";

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _endDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date == null) return;

    setState(() {
      _endDate = date;
      _dateController.text = _formatDate(date);
    });
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    setState(() {
      _title = "";
      _description = "";
      _imageUrl = "";
      _type = "full-time";
      _endDate = null;
      _dateController.clear();
    });
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final loggedIn = await ensureLoggedIn(context);
    if (!loggedIn || !mounted) return;

    final auth = context.read<AuthState>();
    final api = context.read<ApiClient>();
    final token = auth.token!;

    setState(() {
      _isSubmitting = true;
    });

    try {
      final newExperience = Experience(
        title: _title.trim(),
        description: _description.trim(),
        category: _type,
        thumbnail: _imageUrl.trim().isEmpty ? null : _imageUrl.trim(),
        endedAt: _endDate,
      );
      await api.createExperience(newExperience, token: token);
      if (!mounted) return;

      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Experience berhasil ditambahkan!'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Judul: ${newExperience.title}'),
                Text('Deskripsi: ${newExperience.description}'),
                Text('Jenis Kegiatan: ${_types[_type]}'),
                Text('URL Gambar: ${newExperience.thumbnail ?? "-"}'),
                Text(
                  'Tanggal Selesai: ${_endDate == null ? "-" : _formatDate(_endDate!)}',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
      if (!mounted) return;
      _resetForm();
    } on ApiException catch (e) {
      if (!mounted) return;
      final tokenRejected =
          e.statusCode == 401 ||
          (e.statusCode == 403 && e.message.contains('Invalid token'));
      String message;
      if (tokenRejected) {
        await auth.logout();
        message = 'Sesi habis. Silakan login lagi.';
      } else if (e.statusCode == 403) {
        message = 'Akun ini tidak diizinkan menambah experience.';
      } else {
        message = 'Gagal menyimpan (${e.statusCode}).';
      }
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tidak bisa terhubung ke server.')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  InputDecoration _decoration(String hint, {Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hint,
      suffixIcon: suffixIcon,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Tambah Experience Baru')),
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
              _label("Judul Pengalaman"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  decoration: _decoration(
                    "Masukkan nama experience atau pengalaman",
                  ),
                  onChanged: (String? value) => _title = value ?? "",
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Judul pengalaman tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              _label("Deskripsi"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: _decoration("Ceritakan pengalamanmu"),
                  onChanged: (String? value) => _description = value ?? "",
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              _label("Jenis Kegiatan"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: DropdownButtonFormField<String>(
                  decoration: _decoration(""),
                  initialValue: _type,
                  items: _types.entries
                      .map(
                        (e) => DropdownMenuItem(
                          value: e.key,
                          child: Text(e.value),
                        ),
                      )
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _type = newValue ?? "full-time";
                    });
                  },
                ),
              ),

              _label("URL Gambar"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  keyboardType: TextInputType.url,
                  decoration: _decoration(
                    "https://drive.google.com/thumbnail?id=FILE_ID&sz=w1000",
                  ),
                  onChanged: (String? value) => _imageUrl = value ?? "",
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return null; // opsional
                    }
                    final text = value.trim();
                    if (text.length > 200) {
                      return "URL terlalu panjang (maksimal 200 karakter).";
                    }
                    final uri = Uri.tryParse(text);
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

              _label("Tanggal Selesai"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  controller: _dateController,
                  readOnly: true,
                  onTap: _pickDate,
                  decoration: _decoration(
                    "yyyy-mm-dd (kosongkan jika masih berjalan)",
                    suffixIcon: const Icon(Icons.calendar_today_outlined),
                  ),
                ),
              ),

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
                    onPressed: _isSubmitting ? null : _submit,
                    child: _isSubmitting
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text(
                            "Tambah Experience",
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
