import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DownloadButton extends StatefulWidget {
  const DownloadButton({Key? key}) : super(key: key);

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {

  late final List<DownloadController> _downloadController;
  @override
  void initState() {
    _downloadController = List<DownloadController>.generate(20, (index) => SimulateDownloadController(openDownload: () {
      _openDownload(index);
    }),);
    super.initState();
  }
  void _openDownload(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Open App ${index+1}"))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Download Button Animation"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
       child: ListView.separated(
            itemBuilder: _listItem,
            separatorBuilder: (_,__) => const Divider(),
            itemCount: 20),
      ),
    );
  }

  Widget _listItem(BuildContext context, int index) {
    final theme = Theme.of(context);
    final downloadController = _downloadController[index];
    return ListTile(
      leading: const DemoAppIcon(),
      title: Text(
        "App ${index + 1}",
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.titleLarge,
      ),
      subtitle: Text(
          "App description for app ${index + 1}",
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.labelLarge,
      ),
      trailing: SizedBox(
        width: 96,
        child: AnimatedBuilder(
          animation: downloadController,
          builder: (context, child) {
            return CustomDownloadButton(
              downloadStatus: downloadController.downloadStatus,
              downloadProgress: downloadController.progress,
              onDownload: downloadController.startDownload,
              onCancel: downloadController.stopDownload,
              onOpen: downloadController.openDownload,
            );
          },
        ),
      )
    );
  }
}

class CustomDownloadButton extends StatelessWidget {
  const CustomDownloadButton({
    super.key,
    required this.downloadStatus,
    required this.downloadProgress,
    required this.onDownload,
    required this.onCancel,
    required this.onOpen,
    this.transitionDuration = const Duration(milliseconds: 500)
  });

  final DownloadStatus downloadStatus;
  final double downloadProgress;
  final VoidCallback onDownload;
  final VoidCallback onCancel;
  final VoidCallback onOpen;
  final Duration transitionDuration;

  bool get _isDownloading => downloadStatus == DownloadStatus.downloading;
  bool get _isFetchingDownload => downloadStatus == DownloadStatus.fetchingDownload;
  bool get _isDownloaded => downloadStatus == DownloadStatus.downloaded;

  void _onPress() {
    switch(downloadStatus) {
      case DownloadStatus.notDownloaded:
        onDownload();
        break;
      case DownloadStatus.downloaded:
        onOpen();
        break;
      case DownloadStatus.fetchingDownload:
        break;
      case DownloadStatus.downloading:
        onCancel();
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPress,
      child: Stack(
        children: [
          ButtonShapeWidget(
            transitionDuration: transitionDuration,
            isDownloaded: _isDownloaded,
            isDownloading: _isDownloading,
            isFetching: _isFetchingDownload,
          ),
          Positioned.fill(
            child: AnimatedOpacity(
              duration: transitionDuration,
              opacity: _isDownloading || _isFetchingDownload ? 1.0 : 0.0,
              curve: Curves.ease,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ProgressIndicatorWidget(
                    downloadProgress: downloadProgress,
                    isDownloading: _isDownloading,
                    isFetching: _isFetchingDownload,
                  ),
                  if (_isDownloading)
                    const Icon(
                      Icons.stop,
                      size: 14,
                      color: CupertinoColors.activeBlue,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

@immutable
class ButtonShapeWidget extends StatelessWidget {
  const ButtonShapeWidget({
    super.key,
    required this.isDownloading,
    required this.isDownloaded,
    required this.isFetching,
    required this.transitionDuration,
  });

  final bool isDownloading;
  final bool isDownloaded;
  final bool isFetching;
  final Duration transitionDuration;

  @override
  Widget build(BuildContext context) {
    var shape = const ShapeDecoration(
      shape: StadiumBorder(),
      color: CupertinoColors.lightBackgroundGray,
    );

    if (isDownloading || isFetching) {
      shape = ShapeDecoration(
        shape: const CircleBorder(),
        color: Colors.white.withOpacity(0),
      );
    }

    return AnimatedContainer(
      duration: transitionDuration,
      curve: Curves.ease,
      width: double.infinity,
      decoration: shape,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: AnimatedOpacity(
          duration: transitionDuration,
          opacity: isDownloading || isFetching ? 0.0 : 1.0,
          curve: Curves.ease,
          child: Text(
            isDownloaded ? 'OPEN' : 'Get',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: CupertinoColors.activeBlue,
            ),
          ),
        ),
      ),
    );
  }
}

@immutable
class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({
    super.key,
    required this.downloadProgress,
    required this.isDownloading,
    required this.isFetching,
  });

  final double downloadProgress;
  final bool isDownloading;
  final bool isFetching;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: downloadProgress),
        duration: const Duration(milliseconds: 200),
        builder: (context, progress, child) {
          return CircularProgressIndicator(
            backgroundColor: isDownloading
                ? CupertinoColors.lightBackgroundGray
                : Colors.white.withOpacity(0),
            valueColor: AlwaysStoppedAnimation(isFetching
                ? CupertinoColors.lightBackgroundGray
                : CupertinoColors.activeBlue),
            strokeWidth: 2,
            value: isFetching ? null : progress,
          );
        },
      ),
    );
  }
}

@immutable
class DemoAppIcon extends StatelessWidget {
  const DemoAppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
        aspectRatio: 1,
      child: FittedBox(
        child: SizedBox(
          width: 80,
          height: 80,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.green, Colors.black]
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Center(
              child: Icon(
                Icons.gamepad,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }

}


enum DownloadStatus {
  notDownloaded,
  fetchingDownload,
  downloading,
  downloaded
}

abstract class DownloadController implements ChangeNotifier {
  DownloadStatus get downloadStatus;
  double get progress;
  void startDownload();
  void stopDownload();
  void openDownload();
}

class SimulateDownloadController extends DownloadController with ChangeNotifier {

  SimulateDownloadController({
    DownloadStatus downloadStatus = DownloadStatus.notDownloaded,
    double progress = 0.0,
    required VoidCallback openDownload,
}): _downloadStatus = downloadStatus,
  _progress = progress,
  _openDownloaded = openDownload;


  DownloadStatus _downloadStatus;
  @override
  DownloadStatus get downloadStatus => _downloadStatus;

  final VoidCallback _openDownloaded;
  bool _isDownloading = false;

  @override
  void openDownload() {
    if(downloadStatus == DownloadStatus.downloaded) {
      _openDownloaded();
    }
  }

  double _progress;
  @override
  double get progress => _progress;

  @override
  void startDownload() {
     if(downloadStatus == DownloadStatus.notDownloaded) {
       _doSimulatedDownload();
     }
  }

  @override
  void stopDownload() {
    if(_isDownloading) {
      _isDownloading = false;
      _downloadStatus = DownloadStatus.notDownloaded;
      _progress = 0.0;
      notifyListeners();
    }
  }

  Future<void> _doSimulatedDownload() async {
    _isDownloading = true;
    _downloadStatus = DownloadStatus.fetchingDownload;
    notifyListeners();

    // Wait a second to simulate fetch time.
    await Future<void>.delayed(const Duration(seconds: 1));

    // If the user chose to cancel the download, stop the simulation.
    if (!_isDownloading) {
      return;
    }

    // Shift to the downloading phase.
    _downloadStatus = DownloadStatus.downloading;
    notifyListeners();

    const downloadProgressStops = [0.0, 0.15, 0.45, 0.8, 1.0];
    for (final stop in downloadProgressStops) {
      // Wait a second to simulate varying download speeds.
      await Future<void>.delayed(const Duration(seconds: 1));

      // If the user chose to cancel the download, stop the simulation.
      if (!_isDownloading) {
        return;
      }

      // Update the download progress.
      _progress = stop;
      notifyListeners();
    }

    // Wait a second to simulate a final delay.
    await Future<void>.delayed(const Duration(seconds: 1));

    // If the user chose to cancel the download, stop the simulation.
    if (!_isDownloading) {
      return;
    }

    // Shift to the downloaded state, completing the simulation.
    _downloadStatus = DownloadStatus.downloaded;
    _isDownloading = false;
    notifyListeners();
  }

}


