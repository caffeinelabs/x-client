import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// StreamLikesFirehoseLikeWithTweetAuthorFieldsParameterInner.mo
/// Enum values: #created_at, #id, #liked_tweet_author_id, #liked_tweet_id, #timestamp_ms

module {
    public type StreamLikesFirehoseLikeWithTweetAuthorFieldsParameterInner = {
        #created_at;
        #id;
        #liked_tweet_author_id;
        #liked_tweet_id;
        #timestamp_ms;
    };

    public module JSON {
        public func toCandidValue(value : StreamLikesFirehoseLikeWithTweetAuthorFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#created_at) #Text("created_at");
                case (#id) #Text("id");
                case (#liked_tweet_author_id) #Text("liked_tweet_author_id");
                case (#liked_tweet_id) #Text("liked_tweet_id");
                case (#timestamp_ms) #Text("timestamp_ms");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?StreamLikesFirehoseLikeWithTweetAuthorFieldsParameterInner =
            switch (candid) {
                case (#Text("created_at")) ?#created_at;
                case (#Text("id")) ?#id;
                case (#Text("liked_tweet_author_id")) ?#liked_tweet_author_id;
                case (#Text("liked_tweet_id")) ?#liked_tweet_id;
                case (#Text("timestamp_ms")) ?#timestamp_ms;
                case _ null;
            };

        public func toText(value : StreamLikesFirehoseLikeWithTweetAuthorFieldsParameterInner) : Text =
            switch (value) {
                case (#created_at) "created_at";
                case (#id) "id";
                case (#liked_tweet_author_id) "liked_tweet_author_id";
                case (#liked_tweet_id) "liked_tweet_id";
                case (#timestamp_ms) "timestamp_ms";
            };
    };
};
