/// IDs and values of all deleted user-specified stream filtering rules.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// DeleteRulesRequestDelete.mo

module {
    /// The required-fields slice of DeleteRulesRequestDelete — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express DeleteRulesRequestDelete as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        ids : ?[Text];
        values : ?[Text];
    };

    public type DeleteRulesRequestDelete = Required and Optional;

    public module JSON {
        // `init` constructs a DeleteRulesRequestDelete from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { DeleteRulesRequestDelete.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : DeleteRulesRequestDelete {
            let ?res = from_candid(to_candid(required)) : ?DeleteRulesRequestDelete else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : DeleteRulesRequestDelete) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.ids) {
                case (?v__) List.add(buf, ("ids", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            switch (value.values) {
                case (?v__) List.add(buf, ("values", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?DeleteRulesRequestDelete =
            switch (candid) {
                case (#Record(fields)) {
                    let ids : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "ids")) {
                        case (?ids_field) ((switch (ids_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let values : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "values")) {
                        case (?values_field) ((switch (values_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        ids;
                        values;
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
