
// MediaMetrics.mo

module {
    // User-facing type: what application code uses
    public type MediaMetrics = {
        /// Tracks the number of clicks on a call-to-action URL
        cta_url_clicks : ?Int;
        /// Tracks the number of clicks to watch a video or media content
        cta_watch_clicks : ?Int;
        /// Tracks the number of times a video or media is played from a user tap
        play_from_tap : ?Int;
        /// Tracks the number of times a video reaches 25% of its duration
        playback25 : ?Int;
        /// Tracks the number of times a video reaches 50% of its duration
        playback50 : ?Int;
        /// Tracks the number of times a video reaches 75% of its duration
        playback75 : ?Int;
        /// Tracks the number of times a video is played to completion
        playback_complete : ?Int;
        /// Tracks the number of times a video playback is initiated
        playback_start : ?Int;
        /// Tracks the number of times a video is viewed
        video_views : ?Int;
        /// Tracks the total time spent watching a video, measured in milliseconds
        watch_time_ms : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MediaMetrics type
        public type JSON = {
            cta_url_clicks : ?Int;
            cta_watch_clicks : ?Int;
            play_from_tap : ?Int;
            playback25 : ?Int;
            playback50 : ?Int;
            playback75 : ?Int;
            playback_complete : ?Int;
            playback_start : ?Int;
            video_views : ?Int;
            watch_time_ms : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MediaMetrics) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MediaMetrics = ?json;
    }
}
