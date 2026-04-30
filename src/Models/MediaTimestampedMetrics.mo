
import { type MediaMetrics; JSON = MediaMetrics } "./MediaMetrics";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// MediaTimestampedMetrics.mo

module {
    public type MediaTimestampedMetrics = {
        metrics : ?MediaMetrics;
        /// ISO8601 Time
        timestamp : ?Text;
    };

    public module JSON {
        // `init` constructs a MediaTimestampedMetrics from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { MediaTimestampedMetrics.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : MediaTimestampedMetrics {
            let ?res = from_candid(to_candid(required)) : ?MediaTimestampedMetrics else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : MediaTimestampedMetrics) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.metrics) {
                case (?v__) List.add(buf, ("metrics", MediaMetrics.toCandidValue(v__)));
                case null ();
            };
            switch (value.timestamp) {
                case (?v__) List.add(buf, ("timestamp", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?MediaTimestampedMetrics =
            switch (candid) {
                case (#Record(fields)) {
                    let metrics : ?MediaMetrics = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "metrics")) {
                        case (?metrics_field) (MediaMetrics.fromCandidValue(metrics_field.1));
                        case null null;
                    };
                    let timestamp : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "timestamp")) {
                        case (?timestamp_field) ((switch (timestamp_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        metrics;
                        timestamp;
                    };
                };
                case _ null;
            };
    };
};
