import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// GeoRestrictionsOneOf.mo

module {
    /// The required-fields slice of GeoRestrictionsOneOf — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// List of blacklisted country codes
        blacklisted_country_codes : [Text];
        /// List of whitelisted country codes
        whitelisted_country_codes : [Text];
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express GeoRestrictionsOneOf as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type GeoRestrictionsOneOf = Required and Optional;

    public module JSON {
        // `init` constructs a GeoRestrictionsOneOf from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { GeoRestrictionsOneOf.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : GeoRestrictionsOneOf {
            let ?res = from_candid(to_candid(required)) : ?GeoRestrictionsOneOf else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : GeoRestrictionsOneOf) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("blacklisted_country_codes", #Array(Array.map<Text, Candid.Candid>(value.blacklisted_country_codes, func(s : Text) : Candid.Candid = #Text(s)))));
            List.add(buf, ("whitelisted_country_codes", #Array(Array.map<Text, Candid.Candid>(value.whitelisted_country_codes, func(s : Text) : Candid.Candid = #Text(s)))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?GeoRestrictionsOneOf =
            switch (candid) {
                case (#Record(fields)) {
                    let ?blacklisted_country_codes_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "blacklisted_country_codes") else return null;
                    let ?blacklisted_country_codes = ((switch (blacklisted_country_codes_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?whitelisted_country_codes_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "whitelisted_country_codes") else return null;
                    let ?whitelisted_country_codes = ((switch (whitelisted_country_codes_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    ?{
                        blacklisted_country_codes;
                        whitelisted_country_codes;
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
