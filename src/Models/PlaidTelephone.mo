/// Telephone information for the account holder.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// PlaidTelephone.mo

module {
    /// The required-fields slice of PlaidTelephone — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The country code for the phone number (e.g., '+1').
        country : Text;
        /// The phone number.
        number : Text;
        /// The type of phone number (e.g., 'mobile').
        type_ : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express PlaidTelephone as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type PlaidTelephone = Required and Optional;

    public module JSON {
        // `init` constructs a PlaidTelephone from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { PlaidTelephone.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : PlaidTelephone {
            let ?res = from_candid(to_candid(required)) : ?PlaidTelephone else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : PlaidTelephone) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("country", #Text(value.country)));
            List.add(buf, ("number", #Text(value.number)));
            List.add(buf, ("type", #Text(value.type_)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?PlaidTelephone =
            switch (candid) {
                case (#Record(fields)) {
                    let ?country_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "country") else return null;
                    let ?country = ((switch (country_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?number_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "number") else return null;
                    let ?number = ((switch (number_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = ((switch (type__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        country;
                        number;
                        type_;
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
