import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// MediaMetrics.mo

module {
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

    public module JSON {
        // `init` constructs a MediaMetrics from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { MediaMetrics.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : MediaMetrics {
            let ?res = from_candid(to_candid(required)) : ?MediaMetrics else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : MediaMetrics) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.cta_url_clicks) {
                case (?v__) List.add(buf, ("cta_url_clicks", #Int(v__)));
                case null ();
            };
            switch (value.cta_watch_clicks) {
                case (?v__) List.add(buf, ("cta_watch_clicks", #Int(v__)));
                case null ();
            };
            switch (value.play_from_tap) {
                case (?v__) List.add(buf, ("play_from_tap", #Int(v__)));
                case null ();
            };
            switch (value.playback25) {
                case (?v__) List.add(buf, ("playback25", #Int(v__)));
                case null ();
            };
            switch (value.playback50) {
                case (?v__) List.add(buf, ("playback50", #Int(v__)));
                case null ();
            };
            switch (value.playback75) {
                case (?v__) List.add(buf, ("playback75", #Int(v__)));
                case null ();
            };
            switch (value.playback_complete) {
                case (?v__) List.add(buf, ("playback_complete", #Int(v__)));
                case null ();
            };
            switch (value.playback_start) {
                case (?v__) List.add(buf, ("playback_start", #Int(v__)));
                case null ();
            };
            switch (value.video_views) {
                case (?v__) List.add(buf, ("video_views", #Int(v__)));
                case null ();
            };
            switch (value.watch_time_ms) {
                case (?v__) List.add(buf, ("watch_time_ms", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?MediaMetrics =
            switch (candid) {
                case (#Record(fields)) {
                    let cta_url_clicks : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "cta_url_clicks")) {
                        case (?cta_url_clicks_field) ((switch (cta_url_clicks_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let cta_watch_clicks : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "cta_watch_clicks")) {
                        case (?cta_watch_clicks_field) ((switch (cta_watch_clicks_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let play_from_tap : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "play_from_tap")) {
                        case (?play_from_tap_field) ((switch (play_from_tap_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let playback25 : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "playback25")) {
                        case (?playback25_field) ((switch (playback25_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let playback50 : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "playback50")) {
                        case (?playback50_field) ((switch (playback50_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let playback75 : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "playback75")) {
                        case (?playback75_field) ((switch (playback75_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let playback_complete : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "playback_complete")) {
                        case (?playback_complete_field) ((switch (playback_complete_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let playback_start : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "playback_start")) {
                        case (?playback_start_field) ((switch (playback_start_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let video_views : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "video_views")) {
                        case (?video_views_field) ((switch (video_views_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let watch_time_ms : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "watch_time_ms")) {
                        case (?watch_time_ms_field) ((switch (watch_time_ms_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        cta_url_clicks;
                        cta_watch_clicks;
                        play_from_tap;
                        playback25;
                        playback50;
                        playback75;
                        playback_complete;
                        playback_start;
                        video_views;
                        watch_time_ms;
                    };
                };
                case _ null;
            };
    };
};
