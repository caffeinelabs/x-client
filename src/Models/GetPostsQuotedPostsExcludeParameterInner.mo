import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// GetPostsQuotedPostsExcludeParameterInner.mo
/// Enum values: #replies, #retweets

module {
    public type GetPostsQuotedPostsExcludeParameterInner = {
        #replies;
        #retweets;
    };

    public module JSON {
        public func toCandidValue(value : GetPostsQuotedPostsExcludeParameterInner) : Candid.Candid =
            switch (value) {
                case (#replies) #Text("replies");
                case (#retweets) #Text("retweets");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetPostsQuotedPostsExcludeParameterInner =
            switch (candid) {
                case (#Text("replies")) ?#replies;
                case (#Text("retweets")) ?#retweets;
                case _ null;
            };

        public func toText(value : GetPostsQuotedPostsExcludeParameterInner) : Text =
            switch (value) {
                case (#replies) "replies";
                case (#retweets) "retweets";
            };
    };
};
