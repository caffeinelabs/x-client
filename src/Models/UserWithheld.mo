/// Indicates withholding details for [withheld content](https://help.twitter.com/en/rules-and-policies/tweet-withheld-by-country).

import { type UserWithheldScope; JSON = UserWithheldScope } "./UserWithheldScope";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UserWithheld.mo

module {
    /// The required-fields slice of UserWithheld — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// Provides a list of countries where this content is not available.
        country_codes : [Text];
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express UserWithheld as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        scope : ?UserWithheldScope;
    };

    public type UserWithheld = Required and Optional;

    public module JSON {
        // `init` constructs a UserWithheld from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { UserWithheld.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : UserWithheld {
            let ?res = from_candid(to_candid(required)) : ?UserWithheld else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : UserWithheld) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("country_codes", #Array(Array.map<Text, Candid.Candid>(value.country_codes, func(s : Text) : Candid.Candid = #Text(s)))));
            switch (value.scope) {
                case (?v__) List.add(buf, ("scope", UserWithheldScope.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UserWithheld =
            switch (candid) {
                case (#Record(fields)) {
                    let ?country_codes_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "country_codes") else return null;
                    let ?country_codes = ((switch (country_codes_field.1) {
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
                    let scope : ?UserWithheldScope = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "scope")) {
                        case (?scope_field) (UserWithheldScope.fromCandidValue(scope_field.1));
                        case null null;
                    };
                    ?{
                        country_codes;
                        scope;
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
