
import { type NewsContextsEntities; JSON = NewsContextsEntities } "./NewsContextsEntities";

import { type NewsContextsFinance; JSON = NewsContextsFinance } "./NewsContextsFinance";

import { type NewsContextsSports; JSON = NewsContextsSports } "./NewsContextsSports";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// NewsContexts.mo

module {
    /// The required-fields slice of NewsContexts — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express NewsContexts as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        entities : ?NewsContextsEntities;
        finance : ?NewsContextsFinance;
        sports : ?NewsContextsSports;
        topics : ?[Text];
    };

    public type NewsContexts = Required and Optional;

    public module JSON {
        // `init` constructs a NewsContexts from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { NewsContexts.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : NewsContexts {
            let ?res = from_candid(to_candid(required)) : ?NewsContexts else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : NewsContexts) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.entities) {
                case (?v__) List.add(buf, ("entities", NewsContextsEntities.toCandidValue(v__)));
                case null ();
            };
            switch (value.finance) {
                case (?v__) List.add(buf, ("finance", NewsContextsFinance.toCandidValue(v__)));
                case null ();
            };
            switch (value.sports) {
                case (?v__) List.add(buf, ("sports", NewsContextsSports.toCandidValue(v__)));
                case null ();
            };
            switch (value.topics) {
                case (?v__) List.add(buf, ("topics", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?NewsContexts =
            switch (candid) {
                case (#Record(fields)) {
                    let entities : ?NewsContextsEntities = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "entities")) {
                        case (?entities_field) (NewsContextsEntities.fromCandidValue(entities_field.1));
                        case null null;
                    };
                    let finance : ?NewsContextsFinance = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "finance")) {
                        case (?finance_field) (NewsContextsFinance.fromCandidValue(finance_field.1));
                        case null null;
                    };
                    let sports : ?NewsContextsSports = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "sports")) {
                        case (?sports_field) (NewsContextsSports.fromCandidValue(sports_field.1));
                        case null null;
                    };
                    let topics : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "topics")) {
                        case (?topics_field) ((switch (topics_field.1) {
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
                        entities;
                        finance;
                        sports;
                        topics;
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
