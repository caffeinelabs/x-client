/// A count of user-provided stream filtering rules at the client application level.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// AppRulesCount.mo

module {
    /// The required-fields slice of AppRulesCount — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express AppRulesCount as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        client_app_id : ?Text;
        rule_count : ?Int;
    };

    public type AppRulesCount = Required and Optional;

    public module JSON {
        // `init` constructs a AppRulesCount from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { AppRulesCount.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : AppRulesCount {
            let ?res = from_candid(to_candid(required)) : ?AppRulesCount else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : AppRulesCount) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.client_app_id) {
                case (?v__) List.add(buf, ("client_app_id", #Text(v__)));
                case null ();
            };
            switch (value.rule_count) {
                case (?v__) List.add(buf, ("rule_count", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?AppRulesCount =
            switch (candid) {
                case (#Record(fields)) {
                    let client_app_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "client_app_id")) {
                        case (?client_app_id_field) ((switch (client_app_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let rule_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "rule_count")) {
                        case (?rule_count_field) ((switch (rule_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        client_app_id;
                        rule_count;
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
