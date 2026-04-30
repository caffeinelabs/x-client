/// A request to add a user-specified stream filtering rule.

import { type RuleNoId; JSON = RuleNoId } "./RuleNoId";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// AddRulesRequest.mo

module {
    /// The required-fields slice of AddRulesRequest — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        add : [RuleNoId];
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express AddRulesRequest as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type AddRulesRequest = Required and Optional;

    public module JSON {
        // `init` constructs a AddRulesRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { AddRulesRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : AddRulesRequest {
            let ?res = from_candid(to_candid(required)) : ?AddRulesRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : AddRulesRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("add", #Array(Array.map<RuleNoId, Candid.Candid>(value.add, RuleNoId.toCandidValue))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?AddRulesRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?add_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "add") else return null;
                    let ?add = ((switch (add_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<RuleNoId>();
                            for (c__ in xs__.values()) {
                                let ?m__ = RuleNoId.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    ?{
                        add;
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
