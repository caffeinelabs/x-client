import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// MarketplaceHandleAvailability.mo

module {
    /// The required-fields slice of MarketplaceHandleAvailability — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// Availability state of the handle.
        availability_state : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express MarketplaceHandleAvailability as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        redirect_url : ?Text;
    };

    public type MarketplaceHandleAvailability = Required and Optional;

    public module JSON {
        // `init` constructs a MarketplaceHandleAvailability from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { MarketplaceHandleAvailability.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : MarketplaceHandleAvailability {
            let ?res = from_candid(to_candid(required)) : ?MarketplaceHandleAvailability else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : MarketplaceHandleAvailability) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("availability_state", #Text(value.availability_state)));
            switch (value.redirect_url) {
                case (?v__) List.add(buf, ("redirect_url", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?MarketplaceHandleAvailability =
            switch (candid) {
                case (#Record(fields)) {
                    let ?availability_state_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "availability_state") else return null;
                    let ?availability_state = ((switch (availability_state_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let redirect_url : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "redirect_url")) {
                        case (?redirect_url_field) ((switch (redirect_url_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        availability_state;
                        redirect_url;
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
