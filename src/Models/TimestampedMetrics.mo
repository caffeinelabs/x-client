
import { type Metrics; JSON = Metrics } "./Metrics";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TimestampedMetrics.mo

module {
    public type TimestampedMetrics = {
        metrics : ?Metrics;
        /// ISO8601 Time
        timestamp : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : TimestampedMetrics) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.metrics) {
                case (?v__) List.add(buf, ("metrics", Metrics.toCandidValue(v__)));
                case null ();
            };
            switch (value.timestamp) {
                case (?v__) List.add(buf, ("timestamp", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TimestampedMetrics =
            switch (candid) {
                case (#Record(fields)) {
                    let metrics : ?Metrics = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "metrics")) {
                        case (?metrics_field) (Metrics.fromCandidValue(metrics_field.1));
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
