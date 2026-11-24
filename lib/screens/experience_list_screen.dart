import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/config.dart';
import 'package:myportofolio_mobile/models/experience.dart';
import 'package:myportofolio_mobile/screens/experience_detail_screen.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:provider/provider.dart';

class ExperienceListScreen extends StatefulWidget {
  const ExperienceListScreen({super.key});

  @override
  State<ExperienceListScreen> createState() => _ExperienceListScreenState();
}

class _ExperienceListScreenState extends State<ExperienceListScreen> {
  late Future<List<Experience>> _experiencesFuture;

  @override
  void initState() {
    super.initState();
    _experiencesFuture = context.read<ApiClient>().getExperiences();
  }

  Future<void> _reload() async {
    final future = context.read<ApiClient>().getExperiences();
    setState(() {
      _experiencesFuture = future;
    });
    await future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Experiences')),
      drawer: const LeftDrawer(),
      body: FutureBuilder<List<Experience>>(
        future: _experiencesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Failed to load experiences: ${snapshot.error}',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: _reload,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          }

          final experiences = snapshot.data ?? const <Experience>[];

          if (experiences.isEmpty) {
            return RefreshIndicator(
              onRefresh: _reload,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: const Center(child: Text('No experiences found.')),
                ),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: _reload,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: experiences.length,
              itemBuilder: (context, index) {
                final experience = experiences[index];
                return Card(
                  child: ListTile(
                    leading: _Thumb(url: experience.thumbnail),
                    title: Text(experience.title),
                    subtitle: Text(
                      '${experience.category}\n${experience.description}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    isThreeLine: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ExperienceDetailScreen(experience: experience),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _Thumb extends StatelessWidget {
  const _Thumb({this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    final u = url;
    if (u == null || u.isEmpty) {
      return const SizedBox(
        width: 56,
        height: 56,
        child: Icon(Icons.work_outline),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        resolveImageUrl(u),
        width: 56,
        height: 56,
        fit: BoxFit.cover,
        webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
        errorBuilder: (context, error, stackTrace) {
          debugPrint('IMG ERROR: ${resolveImageUrl(u)} -> $error');
          return const SizedBox(
            width: 56,
            height: 56,
            child: Icon(Icons.broken_image_outlined),
          );
        },
      ),
    );
  }
}
