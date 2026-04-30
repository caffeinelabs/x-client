
import { type TimestampedMetrics; JSON = TimestampedMetrics } "./TimestampedMetrics";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// AnalyticsDataInner.mo

module {
    public type AnalyticsDataInner = {
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        id : ?Text;
        /// Array containing metrics data along with the timestamps of their recording.
        timestamped_metrics : ?[TimestampedMetrics];
    };

    public module JSON {
        // `init` constructs a AnalyticsDataInner from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { AnalyticsDataInner.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : AnalyticsDataInner {
            let ?res = from_candid(to_candid(required)) : ?AnalyticsDataInner else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : AnalyticsDataInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.id) {
                case (?v__) List.add(buf, ("id", #Text(v__)));
                case null ();
            };
            switch (value.timestamped_metrics) {
                case (?v__) List.add(buf, ("timestamped_metrics", #Array(Array.map<TimestampedMetrics, Candid.Candid>(v__, TimestampedMetrics.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?AnalyticsDataInner =
            switch (candid) {
                case (#Record(fields)) {
                    let id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id")) {
                        case (?id_field) ((switch (id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let timestamped_metrics : ?[TimestampedMetrics] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "timestamped_metrics")) {
                        case (?timestamped_metrics_field) ((switch (timestamped_metrics_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<TimestampedMetrics>();
                            for (c__ in xs__.values()) {
                                let ?m__ = TimestampedMetrics.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        id;
                        timestamped_metrics;
                    };
                };
                case _ null;
            };
    };
};
