/// The daily usage breakdown for a project

import { type UsageFields; JSON = UsageFields } "./UsageFields";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UsageDailyProjectUsage.mo

module {
    /// The required-fields slice of UsageDailyProjectUsage — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express UsageDailyProjectUsage as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        project_id : ?Int;
        usage : ?[UsageFields];
    };

    public type UsageDailyProjectUsage = Required and Optional;

    public module JSON {
        // `init` constructs a UsageDailyProjectUsage from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { UsageDailyProjectUsage.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : UsageDailyProjectUsage {
            let ?res = from_candid(to_candid(required)) : ?UsageDailyProjectUsage else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : UsageDailyProjectUsage) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.project_id) {
                case (?v__) List.add(buf, ("project_id", #Int(v__)));
                case null ();
            };
            switch (value.usage) {
                case (?v__) List.add(buf, ("usage", #Array(Array.map<UsageFields, Candid.Candid>(v__, UsageFields.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UsageDailyProjectUsage =
            switch (candid) {
                case (#Record(fields)) {
                    let project_id : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "project_id")) {
                        case (?project_id_field) ((switch (project_id_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let usage : ?[UsageFields] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "usage")) {
                        case (?usage_field) ((switch (usage_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<UsageFields>();
                            for (c__ in xs__.values()) {
                                let ?m__ = UsageFields.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        project_id;
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
