/// A response from deleting user-specified stream filtering rules.

import { type DeleteRulesRequestDelete; JSON = DeleteRulesRequestDelete } "./DeleteRulesRequestDelete";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// DeleteRulesRequest.mo

module {
    /// The required-fields slice of DeleteRulesRequest — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        delete : DeleteRulesRequestDelete;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express DeleteRulesRequest as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type DeleteRulesRequest = Required and Optional;

    public module JSON {
        // `init` constructs a DeleteRulesRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { DeleteRulesRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : DeleteRulesRequest {
            let ?res = from_candid(to_candid(required)) : ?DeleteRulesRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : DeleteRulesRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("delete", DeleteRulesRequestDelete.toCandidValue(value.delete)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?DeleteRulesRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?delete_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "delete") else return null;
                    let ?delete = (DeleteRulesRequestDelete.fromCandidValue(delete_field.1)) else return null;
                    ?{
                        delete;
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
