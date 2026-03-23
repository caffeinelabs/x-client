
// GetMediaAnalyticsMediaAnalyticsFieldsParameterInner.mo
/// Enum values: #cta_url_clicks, #cta_watch_clicks, #media_key, #play_from_tap, #playback25, #playback50, #playback75, #playback_complete, #playback_start, #timestamp, #video_views, #watch_time_ms

module {
    // User-facing type: type-safe variants for application code
    public type GetMediaAnalyticsMediaAnalyticsFieldsParameterInner = {
        #cta_url_clicks;
        #cta_watch_clicks;
        #media_key;
        #play_from_tap;
        #playback25;
        #playback50;
        #playback75;
        #playback_complete;
        #playback_start;
        #timestamp;
        #video_views;
        #watch_time_ms;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetMediaAnalyticsMediaAnalyticsFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetMediaAnalyticsMediaAnalyticsFieldsParameterInner) : JSON =
            switch (value) {
                case (#cta_url_clicks) "cta_url_clicks";
                case (#cta_watch_clicks) "cta_watch_clicks";
                case (#media_key) "media_key";
                case (#play_from_tap) "play_from_tap";
                case (#playback25) "playback25";
                case (#playback50) "playback50";
                case (#playback75) "playback75";
                case (#playback_complete) "playback_complete";
                case (#playback_start) "playback_start";
                case (#timestamp) "timestamp";
                case (#video_views) "video_views";
                case (#watch_time_ms) "watch_time_ms";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetMediaAnalyticsMediaAnalyticsFieldsParameterInner =
            switch (json) {
                case "cta_url_clicks" ?#cta_url_clicks;
                case "cta_watch_clicks" ?#cta_watch_clicks;
                case "media_key" ?#media_key;
                case "play_from_tap" ?#play_from_tap;
                case "playback25" ?#playback25;
                case "playback50" ?#playback50;
                case "playback75" ?#playback75;
                case "playback_complete" ?#playback_complete;
                case "playback_start" ?#playback_start;
                case "timestamp" ?#timestamp;
                case "video_views" ?#video_views;
                case "watch_time_ms" ?#watch_time_ms;
                case _ null;
            };
    }
}
