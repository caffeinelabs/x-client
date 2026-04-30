/// Address information for the account holder.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// PlaidAddress.mo

module {
    /// The required-fields slice of PlaidAddress — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The city of the address.
        city : Text;
        /// The country of the address (ISO 3166-1 alpha-2 code).
        country : Text;
        /// The first line of the address.
        line1 : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express PlaidAddress as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        line2 : ?Text;
        postalCode : ?Text;
        region_ : ?Text;
    };

    public type PlaidAddress = Required and Optional;

    public module JSON {
        // `init` constructs a PlaidAddress from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { PlaidAddress.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : PlaidAddress {
            let ?res = from_candid(to_candid(required)) : ?PlaidAddress else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : PlaidAddress) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("city", #Text(value.city)));
            List.add(buf, ("country", #Text(value.country)));
            List.add(buf, ("line1", #Text(value.line1)));
            switch (value.line2) {
                case (?v__) List.add(buf, ("line2", #Text(v__)));
                case null ();
            };
            switch (value.postalCode) {
                case (?v__) List.add(buf, ("postalCode", #Text(v__)));
                case null ();
            };
            switch (value.region_) {
                case (?v__) List.add(buf, ("region", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?PlaidAddress =
            switch (candid) {
                case (#Record(fields)) {
                    let ?city_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "city") else return null;
                    let ?city = ((switch (city_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?country_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "country") else return null;
                    let ?country = ((switch (country_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?line1_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "line1") else return null;
                    let ?line1 = ((switch (line1_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let line2 : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "line2")) {
                        case (?line2_field) ((switch (line2_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let postalCode : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "postalCode")) {
                        case (?postalCode_field) ((switch (postalCode_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let region_ : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "region")) {
                        case (?region__field) ((switch (region__field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        city;
                        country;
                        line1;
                        line2;
                        postalCode;
                        region_;
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
