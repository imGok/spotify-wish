import 'package:appstud/config/app_colors.dart';
import 'package:appstud/core/di/services_di.dart';
import 'package:appstud/core/extensions/track_extension.dart';
import 'package:appstud/models/tracks_model.dart';
import 'package:appstud/services/listening_track_service.dart';
import 'package:flutter/material.dart';

class TrackListTileWidget extends StatelessWidget {
  final TrackInformations track;
  final String? previewUrl;

  const TrackListTileWidget({Key? key, required this.track, this.previewUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasPreviewUrl = previewUrl != null;
    return ListTile(
      enabled: hasPreviewUrl,
      onTap: () => setTrackAsListening(track),
      title: Text(
        track.name!,
        style: TextStyle(
            overflow: TextOverflow.ellipsis,
            color: hasPreviewUrl ? AppColors.textColor : AppColors.disabledColor,
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        track.artists!.map((e) => e.name).join(', '),
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: hasPreviewUrl ? AppColors.secondaryTextColor : AppColors.disabledColor,
        ),
      ),
    );
  }

  void setTrackAsListening(TrackInformations track) {
    final listeningTrackService = locator<ListeningTrackService>();
    listeningTrackService.setTrack(track.toListeningTrack());
  }
}
