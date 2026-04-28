import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner.mo

module {
    public type EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner = {
        metric_type : ?Text;
        metric_value : ?Float;
    };

    public module JSON {
        public func toCandidValue(value : EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.metric_type) {
                case (?v__) List.add(buf, ("metric_type", #Text(v__)));
                case null ();
            };
            switch (value.metric_value) {
                case (?v__) List.add(buf, ("metric_value", #Float(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner =
            switch (candid) {
                case (#Record(fields)) {
                    let metric_type : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "metric_type")) {
                        case (?metric_type_field) ((switch (metric_type_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let metric_value : ?Float = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "metric_value")) {
                        case (?metric_value_field) ((switch (metric_value_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null }));
                        case null null;
                    };
                    ?{
                        metric_type;
                        metric_value;
                    };
                };
                case _ null;
            };
    };
};
