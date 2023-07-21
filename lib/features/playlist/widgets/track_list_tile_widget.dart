import 'package:appstud/config/app_colors.dart';
import 'package:appstud/models/tracks_model.dart';
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
      onTap: () => {},
      title: Text(
        track.name!,
        style: TextStyle(
            overflow: TextOverflow.ellipsis,
            color: hasPreviewUrl ? Colors.white : AppColors.disabledColor,
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
}
