/// Promoted nonpublic engagement metrics for the Media at the time of the request.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// VideoAllOfPromotedMetrics.mo

module {
    /// The required-fields slice of VideoAllOfPromotedMetrics — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express VideoAllOfPromotedMetrics as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        playback_0_count : ?Int;
        playback_100_count : ?Int;
        playback_25_count : ?Int;
        playback_50_count : ?Int;
        playback_75_count : ?Int;
        view_count : ?Int;
    };

    public type VideoAllOfPromotedMetrics = Required and Optional;

    public module JSON {
        // `init` constructs a VideoAllOfPromotedMetrics from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { VideoAllOfPromotedMetrics.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : VideoAllOfPromotedMetrics {
            let ?res = from_candid(to_candid(required)) : ?VideoAllOfPromotedMetrics else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : VideoAllOfPromotedMetrics) : Candid.Candid {
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

        public func fromCandidValue(candid : Candid.Candid) : ?VideoAllOfPromotedMetrics =
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

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
