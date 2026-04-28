/// Organic nonpublic engagement metrics for the Tweet at the time of the request.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetOrganicMetrics.mo

module {
    public type TweetOrganicMetrics = {
        /// Number of times this Tweet has been viewed.
        impression_count : Int;
        /// Number of times this Tweet has been liked.
        like_count : Int;
        /// Number of times this Tweet has been replied to.
        reply_count : Int;
        /// Number of times this Tweet has been Retweeted.
        retweet_count : Int;
    };

    public module JSON {
        public func toCandidValue(value : TweetOrganicMetrics) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("impression_count", #Int(value.impression_count)));
            List.add(buf, ("like_count", #Int(value.like_count)));
            List.add(buf, ("reply_count", #Int(value.reply_count)));
            List.add(buf, ("retweet_count", #Int(value.retweet_count)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetOrganicMetrics =
            switch (candid) {
                case (#Record(fields)) {
                    let ?impression_count_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "impression_count") else return null;
                    let ?impression_count = ((switch (impression_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?like_count_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "like_count") else return null;
                    let ?like_count = ((switch (like_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?reply_count_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "reply_count") else return null;
                    let ?reply_count = ((switch (reply_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?retweet_count_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "retweet_count") else return null;
                    let ?retweet_count = ((switch (retweet_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    ?{
                        impression_count;
                        like_count;
                        reply_count;
                        retweet_count;
                    };
                };
                case _ null;
            };
    };
};
