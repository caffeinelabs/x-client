
import { type MediaTimestampedMetrics; JSON = MediaTimestampedMetrics } "./MediaTimestampedMetrics";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// MediaAnalyticsDataInner.mo

module {
    public type MediaAnalyticsDataInner = {
        /// The Media Key identifier for this attachment.
        media_key : ?Text;
        /// Array containing metrics data along with the timestamps of their recording.
        timestamped_metrics : ?[MediaTimestampedMetrics];
    };

    public module JSON {
        public func toCandidValue(value : MediaAnalyticsDataInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.media_key) {
                case (?v__) List.add(buf, ("media_key", #Text(v__)));
                case null ();
            };
            switch (value.timestamped_metrics) {
                case (?v__) List.add(buf, ("timestamped_metrics", #Array(Array.map<MediaTimestampedMetrics, Candid.Candid>(v__, MediaTimestampedMetrics.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?MediaAnalyticsDataInner =
            switch (candid) {
                case (#Record(fields)) {
                    let media_key : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_key")) {
                        case (?media_key_field) ((switch (media_key_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let timestamped_metrics : ?[MediaTimestampedMetrics] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "timestamped_metrics")) {
                        case (?timestamped_metrics_field) ((switch (timestamped_metrics_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<MediaTimestampedMetrics>();
                            for (c__ in xs__.values()) {
                                let ?m__ = MediaTimestampedMetrics.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        media_key;
                        timestamped_metrics;
                    };
                };
                case _ null;
            };
    };
};
