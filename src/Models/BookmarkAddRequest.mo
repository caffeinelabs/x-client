import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// BookmarkAddRequest.mo

module {
    public type BookmarkAddRequest = {
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        tweet_id : Text;
    };

    public module JSON {
        public func toCandidValue(value : BookmarkAddRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("tweet_id", #Text(value.tweet_id)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?BookmarkAddRequest =
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
