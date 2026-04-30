
import { type EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner; JSON = EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner } "./EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// EngagementMeasurementMetricsTotalInner.mo

module {
    public type EngagementMeasurementMetricsTotalInner = {
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        tweet_id : ?Text;
        value : ?[EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner];
    };

    public module JSON {
        // `init` constructs a EngagementMeasurementMetricsTotalInner from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { EngagementMeasurementMetricsTotalInner.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : EngagementMeasurementMetricsTotalInner {
            let ?res = from_candid(to_candid(required)) : ?EngagementMeasurementMetricsTotalInner else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : EngagementMeasurementMetricsTotalInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.tweet_id) {
                case (?v__) List.add(buf, ("tweet_id", #Text(v__)));
                case null ();
            };
            switch (value.value) {
                case (?v__) List.add(buf, ("value", #Array(Array.map<EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner, Candid.Candid>(v__, EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?EngagementMeasurementMetricsTotalInner =
            switch (candid) {
                case (#Record(fields)) {
                    let tweet_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tweet_id")) {
                        case (?tweet_id_field) ((switch (tweet_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let value : ?[EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "value")) {
                        case (?value_field) ((switch (value_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        tweet_id;
                        value;
                    };
                };
                case _ null;
            };
    };
};
