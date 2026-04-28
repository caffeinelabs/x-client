import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetMediaAnalyticsMediaAnalyticsFieldsParameterInner.mo
/// Enum values: #cta_url_clicks, #cta_watch_clicks, #media_key, #play_from_tap, #playback25, #playback50, #playback75, #playback_complete, #playback_start, #timestamp, #video_views, #watch_time_ms

module {
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

    public module JSON {
        public func toCandidValue(value : GetMediaAnalyticsMediaAnalyticsFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#cta_url_clicks) #Text("cta_url_clicks");
                case (#cta_watch_clicks) #Text("cta_watch_clicks");
                case (#media_key) #Text("media_key");
                case (#play_from_tap) #Text("play_from_tap");
                case (#playback25) #Text("playback25");
                case (#playback50) #Text("playback50");
                case (#playback75) #Text("playback75");
                case (#playback_complete) #Text("playback_complete");
                case (#playback_start) #Text("playback_start");
                case (#timestamp) #Text("timestamp");
                case (#video_views) #Text("video_views");
                case (#watch_time_ms) #Text("watch_time_ms");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetMediaAnalyticsMediaAnalyticsFieldsParameterInner =
            switch (candid) {
                case (#Text("cta_url_clicks")) ?#cta_url_clicks;
                case (#Text("cta_watch_clicks")) ?#cta_watch_clicks;
                case (#Text("media_key")) ?#media_key;
                case (#Text("play_from_tap")) ?#play_from_tap;
                case (#Text("playback25")) ?#playback25;
                case (#Text("playback50")) ?#playback50;
                case (#Text("playback75")) ?#playback75;
                case (#Text("playback_complete")) ?#playback_complete;
                case (#Text("playback_start")) ?#playback_start;
                case (#Text("timestamp")) ?#timestamp;
                case (#Text("video_views")) ?#video_views;
                case (#Text("watch_time_ms")) ?#watch_time_ms;
                case _ null;
            };

        public func toText(value : GetMediaAnalyticsMediaAnalyticsFieldsParameterInner) : Text =
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
    };
};
