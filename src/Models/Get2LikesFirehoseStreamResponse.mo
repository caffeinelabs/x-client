
import { type Expansions; JSON = Expansions } "./Expansions";

import { type LikeWithTweetAuthor; JSON = LikeWithTweetAuthor } "./LikeWithTweetAuthor";

import { type Problem; JSON = Problem } "./Problem";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// Get2LikesFirehoseStreamResponse.mo

module {
    public type Get2LikesFirehoseStreamResponse = {
        data : ?LikeWithTweetAuthor;
        errors : ?[Problem];
        includes : ?Expansions;
    };

    public module JSON {
        // `init` constructs a Get2LikesFirehoseStreamResponse from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { Get2LikesFirehoseStreamResponse.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : Get2LikesFirehoseStreamResponse {
            let ?res = from_candid(to_candid(required)) : ?Get2LikesFirehoseStreamResponse else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : Get2LikesFirehoseStreamResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.data) {
                case (?v__) List.add(buf, ("data", LikeWithTweetAuthor.toCandidValue(v__)));
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
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Get2LikesFirehoseStreamResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let data : ?LikeWithTweetAuthor = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data")) {
                        case (?data_field) (LikeWithTweetAuthor.fromCandidValue(data_field.1));
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
                    ?{
                        data;
                        errors;
                        includes;
                    };
                };
                case _ null;
            };
    };
};
