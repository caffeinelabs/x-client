
import { type TimestampedMetrics; JSON = TimestampedMetrics } "./TimestampedMetrics";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// AnalyticsDataInner.mo

module {
    /// The required-fields slice of AnalyticsDataInner — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express AnalyticsDataInner as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        id : ?Text;
        timestamped_metrics : ?[TimestampedMetrics];
    };

    public type AnalyticsDataInner = Required and Optional;

    public module JSON {
        // `init` constructs a AnalyticsDataInner from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { AnalyticsDataInner.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : AnalyticsDataInner {
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

    /// Re-export of `JSON.init` at the outer module level. Three import shapes
    /// all reach the same function:
    ///
    ///   - `import T "...";                                     T.init {…}`     // whole-module
    ///   - `import { type T; JSON = T } "...";                  T.init {…}`     // JSON-alias
    ///   - `import { type T; JSON = T; init = myInit } "...";   myInit {…}`     // explicit rename
    ///
    /// The third form is handy when several models would all be reachable
    /// as `T.init` and you want each bound to a distinct local name.
    public let init = JSON.init;
};
