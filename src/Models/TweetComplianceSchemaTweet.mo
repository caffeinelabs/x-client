import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetComplianceSchemaTweet.mo

module {
    public type TweetComplianceSchemaTweet = {
        /// Unique identifier of this User. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        author_id : Text;
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        id : Text;
    };

    public module JSON {
        // `init` constructs a TweetComplianceSchemaTweet from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetComplianceSchemaTweet.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            author_id : Text;
            id : Text;
        }) : TweetComplianceSchemaTweet {
            let ?res = from_candid(to_candid(required)) : ?TweetComplianceSchemaTweet else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetComplianceSchemaTweet) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("author_id", #Text(value.author_id)));
            List.add(buf, ("id", #Text(value.id)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetComplianceSchemaTweet =
            switch (candid) {
                case (#Record(fields)) {
                    let ?author_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "author_id") else return null;
                    let ?author_id = ((switch (author_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        author_id;
                        id;
                    };
                };
                case _ null;
            };
    };
};
