import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// Variant.mo

module {
    /// The required-fields slice of Variant — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express Variant as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        bit_rate : ?Int;
        content_type : ?Text;
        url : ?Text;
    };

    public type Variant = Required and Optional;

    public module JSON {
        // `init` constructs a Variant from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { Variant.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : Variant {
            let ?res = from_candid(to_candid(required)) : ?Variant else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : Variant) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.bit_rate) {
                case (?v__) List.add(buf, ("bit_rate", #Int(v__)));
                case null ();
            };
            switch (value.content_type) {
                case (?v__) List.add(buf, ("content_type", #Text(v__)));
                case null ();
            };
            switch (value.url) {
                case (?v__) List.add(buf, ("url", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Variant =
            switch (candid) {
                case (#Record(fields)) {
                    let bit_rate : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "bit_rate")) {
                        case (?bit_rate_field) ((switch (bit_rate_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let content_type : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "content_type")) {
                        case (?content_type_field) ((switch (content_type_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let url : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "url")) {
                        case (?url_field) ((switch (url_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        bit_rate;
                        content_type;
                        url;
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
