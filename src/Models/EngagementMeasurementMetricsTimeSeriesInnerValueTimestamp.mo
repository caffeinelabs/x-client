import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp.mo

module {
    public type EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp = {
        iso8601_time : ?Text;
    };

    public module JSON {
        // `init` constructs a EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp {
            let ?res = from_candid(to_candid(required)) : ?EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.iso8601_time) {
                case (?v__) List.add(buf, ("iso8601_time", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp =
            switch (candid) {
                case (#Record(fields)) {
                    let iso8601_time : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "iso8601_time")) {
                        case (?iso8601_time_field) ((switch (iso8601_time_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        iso8601_time;
                    };
                };
                case _ null;
            };
    };
};
