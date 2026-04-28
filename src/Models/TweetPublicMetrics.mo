/// Engagement metrics for the Tweet at the time of the request.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetPublicMetrics.mo

module {
    public type TweetPublicMetrics = {
        /// Number of times this Tweet has been bookmarked.
        bookmark_count : Int;
        /// Number of times this Tweet has been viewed.
        impression_count : Int;
        /// Number of times this Tweet has been liked.
        like_count : Int;
        /// Number of times this Tweet has been quoted.
        quote_count : ?Int;
        /// Number of times this Tweet has been replied to.
        reply_count : Int;
        /// Number of times this Tweet has been Retweeted.
        retweet_count : Int;
    };

    public module JSON {
        public func toCandidValue(value : TweetPublicMetrics) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("bookmark_count", #Int(value.bookmark_count)));
            List.add(buf, ("impression_count", #Int(value.impression_count)));
            List.add(buf, ("like_count", #Int(value.like_count)));
            switch (value.quote_count) {
                case (?v__) List.add(buf, ("quote_count", #Int(v__)));
                case null ();
            };
            List.add(buf, ("reply_count", #Int(value.reply_count)));
            List.add(buf, ("retweet_count", #Int(value.retweet_count)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetPublicMetrics =
            switch (candid) {
                case (#Record(fields)) {
                    let ?bookmark_count_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "bookmark_count") else return null;
                    let ?bookmark_count = ((switch (bookmark_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?impression_count_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "impression_count") else return null;
                    let ?impression_count = ((switch (impression_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?like_count_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "like_count") else return null;
                    let ?like_count = ((switch (like_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let quote_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "quote_count")) {
                        case (?quote_count_field) ((switch (quote_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let ?reply_count_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "reply_count") else return null;
                    let ?reply_count = ((switch (reply_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?retweet_count_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "retweet_count") else return null;
                    let ?retweet_count = ((switch (retweet_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    ?{
                        bookmark_count;
                        impression_count;
                        like_count;
                        quote_count;
                        reply_count;
                        retweet_count;
                    };
                };
                case _ null;
            };
    };
};
