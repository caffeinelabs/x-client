
import { type EngagementMeasurementMetricsTimeSeriesInner; JSON = EngagementMeasurementMetricsTimeSeriesInner } "./EngagementMeasurementMetricsTimeSeriesInner";

import { type EngagementMeasurementMetricsTotalInner; JSON = EngagementMeasurementMetricsTotalInner } "./EngagementMeasurementMetricsTotalInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// EngagementMeasurement.mo

module {
    public type EngagementMeasurement = {
        metrics_time_series : ?[EngagementMeasurementMetricsTimeSeriesInner];
        metrics_total : ?[EngagementMeasurementMetricsTotalInner];
    };

    public module JSON {
        public func toCandidValue(value : EngagementMeasurement) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.metrics_time_series) {
                case (?v__) List.add(buf, ("metrics_time_series", #Array(Array.map<EngagementMeasurementMetricsTimeSeriesInner, Candid.Candid>(v__, EngagementMeasurementMetricsTimeSeriesInner.toCandidValue))));
                case null ();
            };
            switch (value.metrics_total) {
                case (?v__) List.add(buf, ("metrics_total", #Array(Array.map<EngagementMeasurementMetricsTotalInner, Candid.Candid>(v__, EngagementMeasurementMetricsTotalInner.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?EngagementMeasurement =
            switch (candid) {
                case (#Record(fields)) {
                    let metrics_time_series : ?[EngagementMeasurementMetricsTimeSeriesInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "metrics_time_series")) {
                        case (?metrics_time_series_field) ((switch (metrics_time_series_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<EngagementMeasurementMetricsTimeSeriesInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = EngagementMeasurementMetricsTimeSeriesInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let metrics_total : ?[EngagementMeasurementMetricsTotalInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "metrics_total")) {
                        case (?metrics_total_field) ((switch (metrics_total_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<EngagementMeasurementMetricsTotalInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = EngagementMeasurementMetricsTotalInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        metrics_time_series;
                        metrics_total;
                    };
                };
                case _ null;
            };
    };
};
