
import { type EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner; JSON = EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner } "./EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner";

import { type EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp; JSON = EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp } "./EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// EngagementMeasurementMetricsTimeSeriesInnerValue.mo

module {
    public type EngagementMeasurementMetricsTimeSeriesInnerValue = {
        metric_values : ?[EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner];
        timestamp : ?EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp;
    };

    public module JSON {
        public func toCandidValue(value : EngagementMeasurementMetricsTimeSeriesInnerValue) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.metric_values) {
                case (?v__) List.add(buf, ("metric_values", #Array(Array.map<EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner, Candid.Candid>(v__, EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner.toCandidValue))));
                case null ();
            };
            switch (value.timestamp) {
                case (?v__) List.add(buf, ("timestamp", EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?EngagementMeasurementMetricsTimeSeriesInnerValue =
            switch (candid) {
                case (#Record(fields)) {
                    let metric_values : ?[EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "metric_values")) {
                        case (?metric_values_field) ((switch (metric_values_field.1) {
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
                    let timestamp : ?EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "timestamp")) {
                        case (?timestamp_field) (EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp.fromCandidValue(timestamp_field.1));
                        case null null;
                    };
                    ?{
                        metric_values;
                        timestamp;
                    };
                };
                case _ null;
            };
    };
};
