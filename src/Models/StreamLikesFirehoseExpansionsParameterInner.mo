import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// StreamLikesFirehoseExpansionsParameterInner.mo
/// Enum values: #liked_tweet_author_id, #liked_tweet_id

module {
    public type StreamLikesFirehoseExpansionsParameterInner = {
        #liked_tweet_author_id;
        #liked_tweet_id;
    };

    public module JSON {
        public func toCandidValue(value : StreamLikesFirehoseExpansionsParameterInner) : Candid.Candid =
            switch (value) {
                case (#liked_tweet_author_id) #Text("liked_tweet_author_id");
                case (#liked_tweet_id) #Text("liked_tweet_id");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?StreamLikesFirehoseExpansionsParameterInner =
            switch (candid) {
                case (#Text("liked_tweet_author_id")) ?#liked_tweet_author_id;
                case (#Text("liked_tweet_id")) ?#liked_tweet_id;
                case _ null;
            };

        public func toText(value : StreamLikesFirehoseExpansionsParameterInner) : Text =
            switch (value) {
                case (#liked_tweet_author_id) "liked_tweet_author_id";
                case (#liked_tweet_id) "liked_tweet_id";
            };
    };
};
