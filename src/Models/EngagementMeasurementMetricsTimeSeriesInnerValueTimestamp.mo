import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp.mo

module {
    public type EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp = {
        iso8601_time : ?Text;
    };

    public module JSON {
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
