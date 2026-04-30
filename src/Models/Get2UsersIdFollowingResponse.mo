
import { type Expansions; JSON = Expansions } "./Expansions";

import { type Get2DmConversationsIdDmEventsResponseMeta; JSON = Get2DmConversationsIdDmEventsResponseMeta } "./Get2DmConversationsIdDmEventsResponseMeta";

import { type Problem; JSON = Problem } "./Problem";

import { type User; JSON = User } "./User";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// Get2UsersIdFollowingResponse.mo

module {
    /// The required-fields slice of Get2UsersIdFollowingResponse — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express Get2UsersIdFollowingResponse as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        data : ?[User];
        errors : ?[Problem];
        includes : ?Expansions;
        meta : ?Get2DmConversationsIdDmEventsResponseMeta;
    };

    public type Get2UsersIdFollowingResponse = Required and Optional;

    public module JSON {
        // `init` constructs a Get2UsersIdFollowingResponse from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { Get2UsersIdFollowingResponse.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : Get2UsersIdFollowingResponse {
            let ?res = from_candid(to_candid(required)) : ?Get2UsersIdFollowingResponse else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : Get2UsersIdFollowingResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.data) {
                case (?v__) List.add(buf, ("data", #Array(Array.map<User, Candid.Candid>(v__, User.toCandidValue))));
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
                case (?v__) List.add(buf, ("meta", Get2DmConversationsIdDmEventsResponseMeta.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Get2UsersIdFollowingResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let data : ?[User] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data")) {
                        case (?data_field) ((switch (data_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<User>();
                            for (c__ in xs__.values()) {
                                let ?m__ = User.fromCandidValue(c__) else return null;
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
                    let meta : ?Get2DmConversationsIdDmEventsResponseMeta = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "meta")) {
                        case (?meta_field) (Get2DmConversationsIdDmEventsResponseMeta.fromCandidValue(meta_field.1));
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
