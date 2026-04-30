/// A user id for the plaid customer
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// PlaidCustomer.mo

module {
    /// The required-fields slice of PlaidCustomer — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express PlaidCustomer as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        customerId : ?Text;
    };

    public type PlaidCustomer = Required and Optional;

    public module JSON {
        // `init` constructs a PlaidCustomer from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { PlaidCustomer.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : PlaidCustomer {
            let ?res = from_candid(to_candid(required)) : ?PlaidCustomer else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : PlaidCustomer) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.customerId) {
                case (?v__) List.add(buf, ("customerId", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?PlaidCustomer =
            switch (candid) {
                case (#Record(fields)) {
                    let customerId : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "customerId")) {
                        case (?customerId_field) ((switch (customerId_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        customerId;
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
