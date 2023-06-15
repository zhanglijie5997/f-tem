import 'dart:async';
import 'dart:math';

import 'package:art_app/hook/notify_hook/notify_hook.dart';



class PlaybackTimer {
  final Duration _clockTic = const Duration(seconds: 1);
  Duration? _totalTime;

  bool _isPlaying = false;

  Timer? _timer;
  Duration _now = Duration.zero;

  final Function(Duration duration)? _onDone;
  final Function(Duration duration)? _onData;

  PlaybackTimer({
    Function(Duration duration)? onDone,
    Function(Duration duration)? onData,
  })  : _onDone = onDone,
        _onData = onData;

  Duration get now => _now;
  set now(Duration duration) {
    _now = duration;
    if (_onData != null) _onData!(now);
  }

  bool get isPlaying => _isPlaying;

  void playPause(Duration totalTime) {
    if (now == Duration.zero) {
      _startNewCycle(totalTime);
      return;
    }
    if (_isPlaying) {
      _isPlaying = false;
      _timer?.cancel();
      return;
    }
    _resume();
  }

  void goTo(Duration moment) {
    if (moment == _totalTime) {
      stop();
      if (_onDone != null) _onDone!(now);
    } else {
      now = moment;
    }
  }

  void stop() {
    _isPlaying = false;

    _timer?.cancel();
    _timer = null;

    _totalTime = null;
    now = Duration.zero;
  }

  void _startNewCycle(Duration totalTime) {
    _isPlaying = false;

    _timer?.cancel();
    _timer = null;

    _totalTime = totalTime;
    now = Duration.zero;

    _resume();
  }

  void _resume() {
    _isPlaying = true;

    _timer = Timer(_clockTic, () {
      now += _clockTic;

      if (now > _totalTime!) {
        _timer!.cancel();
        now = Duration.zero;

        if (isPlaying && _onDone != null) _onDone!(now);
      } else {
        _resume();
      }
    });
  }
}


enum MediaLifeCycle {
  Stopped,
  Paused,
  Playing,
}

class MediaPlayerCentral {

  static final PlaybackTimer _timer = PlaybackTimer(
      onDone: (Duration duration){
        if(hasNextMedia) {
          nextMedia();
        } else {
          stop();
        }
      },
      onData: (Duration duration){
        _mediaProgress.add(_timer.now);
      }
  );

  static String getCloseCaption(Duration duration){
    if( currentMedia?.closeCaption.isEmpty ?? true ) return '';

    for(CloseCaptionElement cc in currentMedia!.closeCaption){
      if(cc.start <= duration && cc.end >= duration) return cc.subtitle;
    }

    return '';
  }

  static Duration replayTolerance = const Duration(seconds: 4);

  static int _index = 0;
  static MediaLifeCycle _lifeCycle = MediaLifeCycle.Stopped;
  static final List<MediaModel> _playlist = [];

  // ignore: close_sinks
  static StreamController<MediaModel> _mediaBroadcaster =
      StreamController<MediaModel>.broadcast();
  static StreamController<Duration> _mediaProgress =
      StreamController<Duration>.broadcast();

  Stream<MediaModel> get mediaBroadcaster {
    return _mediaBroadcaster.stream;
  }

  Stream<Duration> get mediaProgress {
    return _mediaProgress.stream;
  }

  static int get index => _index;
  static set index(int index) {
    _index = min(_playlist.length, max(0, index));
  }

  static Duration get currentDuration => _timer.now;

  static bool get isPlaying {
    return _lifeCycle == MediaLifeCycle.Playing;
  }

  static MediaLifeCycle get mediaLifeCycle => _lifeCycle;

  static MediaModel? get currentMedia {
    return _playlist.isEmpty ? null : _playlist[_index];
  }

  static bool get isEmpty => _playlist.isEmpty;
  static bool get hasAnyMedia => _playlist.isNotEmpty;
  static bool get hasNextMedia => hasAnyMedia && index < _playlist.length - 1;
  static bool get hasPreviousMedia => hasAnyMedia && index > 0;

  static Stream get mediaStream {
    if (_mediaBroadcaster.isClosed) {
      _mediaBroadcaster = StreamController<MediaModel>.broadcast();
    }
    return _mediaBroadcaster.stream;
  }
  static Stream get progressStream {
    if (_mediaProgress.isClosed) {
      _mediaProgress = StreamController<Duration>.broadcast();
    }
    return _mediaProgress.stream;
  }
  static StreamSink get mediaSink => _mediaBroadcaster.sink;
  static StreamSink get progressSink => _mediaProgress.sink;

  static void _broadcastChanges(){
    _mediaBroadcaster.sink.add(
        currentMedia!
    );
    _mediaProgress.sink.add(
        _timer.now
    );
  }

  static void add(MediaModel newMedia) {
    if (_playlist.contains(newMedia)) {
    } else {
      _playlist.add(newMedia);
    }
  }

  static void addAll(List<MediaModel> newMedias) {
    _playlist.addAll(newMedias);
  }

  static void remove(MediaModel oldMedia) {
    if (currentMedia == oldMedia) {
      _timer.stop();
      _playlist.remove(oldMedia);
      _broadcastChanges();
    } else {
      _playlist.remove(oldMedia);
    }
  }

  static void clear() {
    _playlist.clear();
    stop();
  }

  static void playPause() {
    switch (_lifeCycle) {
      case MediaLifeCycle.Stopped:
      case MediaLifeCycle.Paused:
        _lifeCycle = MediaLifeCycle.Playing;
        _timer.playPause(currentMedia!.trackSize);
        _broadcastChanges();
        break;

      case MediaLifeCycle.Playing:
        _lifeCycle = MediaLifeCycle.Paused;
        _timer.playPause(currentMedia!.trackSize);
        _broadcastChanges();
        break;
    }
  }

  static void stop() {
    _lifeCycle = MediaLifeCycle.Stopped;
    _timer.stop();
    _broadcastChanges();
  }

  static void goTo(Duration moment) {
    _timer.goTo(moment);
    _lifeCycle = _timer.isPlaying ? MediaLifeCycle.Playing : _lifeCycle;
    _broadcastChanges();
  }

  static void nextMedia() {
    if (hasNextMedia) {
      _index++;
    }

    switch (_lifeCycle) {
      case MediaLifeCycle.Stopped:
        _timer.stop();
        _lifeCycle = MediaLifeCycle.Stopped;
        break;

      case MediaLifeCycle.Paused:
        _timer.stop();
        _lifeCycle = MediaLifeCycle.Paused;
        break;

      case MediaLifeCycle.Playing:
        _timer.stop();
        _timer.playPause(currentMedia!.trackSize);
        _lifeCycle = MediaLifeCycle.Playing;
        break;
    }
    _broadcastChanges();
  }

  static void previousMedia() {
    if (hasPreviousMedia) {
      if (_timer.now < replayTolerance) {
        _index--;
      }
    }

    switch (_lifeCycle) {
      case MediaLifeCycle.Playing:
        _timer.stop();
        _timer.playPause(currentMedia!.trackSize);
        _lifeCycle = MediaLifeCycle.Playing;
        break;

      case MediaLifeCycle.Paused:
        _timer.stop();
        _lifeCycle = MediaLifeCycle.Paused;
        break;

      case MediaLifeCycle.Stopped:
        break;
    }

    _broadcastChanges();
  }

  dispose() {
    _mediaBroadcaster.sink.close();
    _mediaProgress.sink.close();
  }
}
