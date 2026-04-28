
import { type EngagementMeasurementMetricsTimeSeriesInnerValue; JSON = EngagementMeasurementMetricsTimeSeriesInnerValue } "./EngagementMeasurementMetricsTimeSeriesInnerValue";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// EngagementMeasurementMetricsTimeSeriesInner.mo

module {
    public type EngagementMeasurementMetricsTimeSeriesInner = {
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        tweet_id : ?Text;
        value : ?EngagementMeasurementMetricsTimeSeriesInnerValue;
    };

    public module JSON {
        public func toCandidValue(value : EngagementMeasurementMetricsTimeSeriesInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.tweet_id) {
                case (?v__) List.add(buf, ("tweet_id", #Text(v__)));
                case null ();
            };
            switch (value.value) {
                case (?v__) List.add(buf, ("value", EngagementMeasurementMetricsTimeSeriesInnerValue.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?EngagementMeasurementMetricsTimeSeriesInner =
            switch (candid) {
                case (#Record(fields)) {
                    let tweet_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tweet_id")) {
                        case (?tweet_id_field) ((switch (tweet_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let value : ?EngagementMeasurementMetricsTimeSeriesInnerValue = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "value")) {
                        case (?value_field) (EngagementMeasurementMetricsTimeSeriesInnerValue.fromCandidValue(value_field.1));
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
