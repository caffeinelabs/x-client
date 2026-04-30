
import { type Expansions; JSON = Expansions } "./Expansions";

import { type Get2UsersIdMentionsResponseMeta; JSON = Get2UsersIdMentionsResponseMeta } "./Get2UsersIdMentionsResponseMeta";

import { type Problem; JSON = Problem } "./Problem";

import { type Tweet; JSON = Tweet } "./Tweet";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// Get2UsersIdTimelinesReverseChronologicalResponse.mo

module {
    /// The required-fields slice of Get2UsersIdTimelinesReverseChronologicalResponse — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express Get2UsersIdTimelinesReverseChronologicalResponse as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        data : ?[Tweet];
        errors : ?[Problem];
        includes : ?Expansions;
        meta : ?Get2UsersIdMentionsResponseMeta;
    };

    public type Get2UsersIdTimelinesReverseChronologicalResponse = Required and Optional;

    public module JSON {
        // `init` constructs a Get2UsersIdTimelinesReverseChronologicalResponse from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { Get2UsersIdTimelinesReverseChronologicalResponse.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : Get2UsersIdTimelinesReverseChronologicalResponse {
            let ?res = from_candid(to_candid(required)) : ?Get2UsersIdTimelinesReverseChronologicalResponse else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : Get2UsersIdTimelinesReverseChronologicalResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.data) {
                case (?v__) List.add(buf, ("data", #Array(Array.map<Tweet, Candid.Candid>(v__, Tweet.toCandidValue))));
                case null ();
            };
            switch (value.errors) {
                case (?v__) List.add(buf, ("errors", #Array(Array.map<Problem, Candid.Candid>(v__, Problem.toCandidValue))));
                case null ();
            };
            switch (value.includes) {
                case (?v__) List.add(buf, ("includes", Expansions.toCandidValue(v__)));
                case null ();
            };
            switch (value.meta) {
                case (?v__) List.add(buf, ("meta", Get2UsersIdMentionsResponseMeta.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Get2UsersIdTimelinesReverseChronologicalResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let data : ?[Tweet] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data")) {
                        case (?data_field) ((switch (data_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Tweet>();
                            for (c__ in xs__.values()) {
                                let ?m__ = Tweet.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let errors : ?[Problem] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "errors")) {
                        case (?errors_field) ((switch (errors_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Problem>();
                            for (c__ in xs__.values()) {
                                let ?m__ = Problem.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let includes : ?Expansions = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "includes")) {
                        case (?includes_field) (Expansions.fromCandidValue(includes_field.1));
                        case null null;
                    };
                    let meta : ?Get2UsersIdMentionsResponseMeta = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "meta")) {
                        case (?meta_field) (Get2UsersIdMentionsResponseMeta.fromCandidValue(meta_field.1));
                        case null null;
                    };
                    ?{
                        data;
                        errors;
                        includes;
                        meta;
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
