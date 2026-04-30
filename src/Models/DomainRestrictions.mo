import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// DomainRestrictions.mo

module {
    /// The required-fields slice of DomainRestrictions — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// List of whitelisted domains
        whitelist : [Text];
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express DomainRestrictions as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type DomainRestrictions = Required and Optional;

    public module JSON {
        // `init` constructs a DomainRestrictions from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { DomainRestrictions.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : DomainRestrictions {
            let ?res = from_candid(to_candid(required)) : ?DomainRestrictions else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : DomainRestrictions) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("whitelist", #Array(Array.map<Text, Candid.Candid>(value.whitelist, func(s : Text) : Candid.Candid = #Text(s)))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?DomainRestrictions =
            switch (candid) {
                case (#Record(fields)) {
                    let ?whitelist_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "whitelist") else return null;
                    let ?whitelist = ((switch (whitelist_field.1) {
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
                        whitelist;
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
