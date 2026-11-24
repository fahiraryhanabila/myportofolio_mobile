import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/config.dart';
import 'package:myportofolio_mobile/models/experience.dart';

class ExperienceDetailScreen extends StatelessWidget {
  const ExperienceDetailScreen({super.key, required this.experience});

  final Experience experience;

  String _formatDate(DateTime? date) =>
      date == null ? '-' : date.toLocal().toString().split(' ').first;

  @override
  Widget build(BuildContext context) {
    final thumbnail = experience.thumbnail;

    return Scaffold(
      appBar: AppBar(title: Text(experience.title)),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (thumbnail != null && thumbnail.isNotEmpty) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.network(
                        resolveImageUrl(thumbnail),
                        width: double.infinity,
                        fit: BoxFit.cover,
                        webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
                        errorBuilder: (context, error, stackTrace) {
                          debugPrint(
                            'IMG ERROR: ${resolveImageUrl(thumbnail)} -> $error',
                          );
                          return const Center(
                            child: Icon(Icons.broken_image_outlined, size: 48),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                Text(
                  experience.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Chip(label: Text(experience.category)),
                const SizedBox(height: 16),
                Text(experience.description),
                const SizedBox(height: 16),
                Text('Started: ${_formatDate(experience.startedAt)}'),
                Text(
                  experience.isOngoing
                      ? 'Status: Ongoing'
                      : 'Ended: ${_formatDate(experience.endedAt)}',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
