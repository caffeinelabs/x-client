/// Represents the data for Usage
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UsageFields.mo

module {
    /// The required-fields slice of UsageFields — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express UsageFields as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        date : ?Text;
        usage : ?Int;
    };

    public type UsageFields = Required and Optional;

    public module JSON {
        // `init` constructs a UsageFields from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { UsageFields.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : UsageFields {
            let ?res = from_candid(to_candid(required)) : ?UsageFields else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : UsageFields) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.date) {
                case (?v__) List.add(buf, ("date", #Text(v__)));
                case null ();
            };
            switch (value.usage) {
                case (?v__) List.add(buf, ("usage", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UsageFields =
            switch (candid) {
                case (#Record(fields)) {
                    let date : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "date")) {
                        case (?date_field) ((switch (date_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let usage : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "usage")) {
                        case (?usage_field) ((switch (usage_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        date;
                        usage;
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
