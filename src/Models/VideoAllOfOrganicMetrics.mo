/// Organic nonpublic engagement metrics for the Media at the time of the request.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// VideoAllOfOrganicMetrics.mo

module {
    public type VideoAllOfOrganicMetrics = {
        /// Number of users who made it through 0% of the video.
        playback_0_count : ?Int;
        /// Number of users who made it through 100% of the video.
        playback_100_count : ?Int;
        /// Number of users who made it through 25% of the video.
        playback_25_count : ?Int;
        /// Number of users who made it through 50% of the video.
        playback_50_count : ?Int;
        /// Number of users who made it through 75% of the video.
        playback_75_count : ?Int;
        /// Number of times this video has been viewed.
        view_count : ?Int;
    };

    public module JSON {
        public func toCandidValue(value : VideoAllOfOrganicMetrics) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.playback_0_count) {
                case (?v__) List.add(buf, ("playback_0_count", #Int(v__)));
                case null ();
            };
            switch (value.playback_100_count) {
                case (?v__) List.add(buf, ("playback_100_count", #Int(v__)));
                case null ();
            };
            switch (value.playback_25_count) {
                case (?v__) List.add(buf, ("playback_25_count", #Int(v__)));
                case null ();
            };
            switch (value.playback_50_count) {
                case (?v__) List.add(buf, ("playback_50_count", #Int(v__)));
                case null ();
            };
            switch (value.playback_75_count) {
                case (?v__) List.add(buf, ("playback_75_count", #Int(v__)));
                case null ();
            };
            switch (value.view_count) {
                case (?v__) List.add(buf, ("view_count", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?VideoAllOfOrganicMetrics =
            switch (candid) {
                case (#Record(fields)) {
                    let playback_0_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "playback_0_count")) {
                        case (?playback_0_count_field) ((switch (playback_0_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let playback_100_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "playback_100_count")) {
                        case (?playback_100_count_field) ((switch (playback_100_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let playback_25_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "playback_25_count")) {
                        case (?playback_25_count_field) ((switch (playback_25_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let playback_50_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "playback_50_count")) {
                        case (?playback_50_count_field) ((switch (playback_50_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let playback_75_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "playback_75_count")) {
                        case (?playback_75_count_field) ((switch (playback_75_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let view_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "view_count")) {
                        case (?view_count_field) ((switch (view_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        playback_0_count;
                        playback_100_count;
                        playback_25_count;
                        playback_50_count;
                        playback_75_count;
                        view_count;
                    };
                };
                case _ null;
            };
    };
};
