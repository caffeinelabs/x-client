
import { type Problem; JSON = Problem } "./Problem";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// LikesComplianceStreamResponseOneOf1.mo

module {
    /// The required-fields slice of LikesComplianceStreamResponseOneOf1 — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        errors : [Problem];
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express LikesComplianceStreamResponseOneOf1 as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type LikesComplianceStreamResponseOneOf1 = Required and Optional;

    public module JSON {
        // `init` constructs a LikesComplianceStreamResponseOneOf1 from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { LikesComplianceStreamResponseOneOf1.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : LikesComplianceStreamResponseOneOf1 {
            let ?res = from_candid(to_candid(required)) : ?LikesComplianceStreamResponseOneOf1 else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : LikesComplianceStreamResponseOneOf1) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("errors", #Array(Array.map<Problem, Candid.Candid>(value.errors, Problem.toCandidValue))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?LikesComplianceStreamResponseOneOf1 =
            switch (candid) {
                case (#Record(fields)) {
                    let ?errors_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "errors") else return null;
                    let ?errors = ((switch (errors_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Problem>();
                            for (c__ in xs__.values()) {
                                let ?m__ = Problem.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    ?{
                        errors;
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
