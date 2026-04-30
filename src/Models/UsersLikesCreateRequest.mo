import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UsersLikesCreateRequest.mo

module {
    public type UsersLikesCreateRequest = {
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        tweet_id : Text;
    };

    public module JSON {
        // `init` constructs a UsersLikesCreateRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { UsersLikesCreateRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            tweet_id : Text;
        }) : UsersLikesCreateRequest {
            let ?res = from_candid(to_candid(required)) : ?UsersLikesCreateRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : UsersLikesCreateRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("tweet_id", #Text(value.tweet_id)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UsersLikesCreateRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?tweet_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tweet_id") else return null;
                    let ?tweet_id = ((switch (tweet_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        tweet_id;
                    };
                };
                case _ null;
            };
    };
};
