/// A trend.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// PersonalizedTrend.mo

module {
    /// The required-fields slice of PersonalizedTrend — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express PersonalizedTrend as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        category : ?Text;
        post_count : ?Int;
        trend_name : ?Text;
        trending_since : ?Text;
    };

    public type PersonalizedTrend = Required and Optional;

    public module JSON {
        // `init` constructs a PersonalizedTrend from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { PersonalizedTrend.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : PersonalizedTrend {
            let ?res = from_candid(to_candid(required)) : ?PersonalizedTrend else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : PersonalizedTrend) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.category) {
                case (?v__) List.add(buf, ("category", #Text(v__)));
                case null ();
            };
            switch (value.post_count) {
                case (?v__) List.add(buf, ("post_count", #Int(v__)));
                case null ();
            };
            switch (value.trend_name) {
                case (?v__) List.add(buf, ("trend_name", #Text(v__)));
                case null ();
            };
            switch (value.trending_since) {
                case (?v__) List.add(buf, ("trending_since", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?PersonalizedTrend =
            switch (candid) {
                case (#Record(fields)) {
                    let category : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "category")) {
                        case (?category_field) ((switch (category_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let post_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "post_count")) {
                        case (?post_count_field) ((switch (post_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let trend_name : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "trend_name")) {
                        case (?trend_name_field) ((switch (trend_name_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let trending_since : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "trending_since")) {
                        case (?trending_since_field) ((switch (trending_since_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        category;
                        post_count;
                        trend_name;
                        trending_since;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
