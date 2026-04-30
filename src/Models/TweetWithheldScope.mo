/// Indicates whether the content being withheld is the `tweet` or a `user`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetWithheldScope.mo
/// Enum values: #tweet, #user

module {
    public type TweetWithheldScope = {
        #tweet;
        #user;
    };

    public module JSON {
        public func toCandidValue(value : TweetWithheldScope) : Candid.Candid =
            switch (value) {
                case (#tweet) #Text("tweet");
                case (#user) #Text("user");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetWithheldScope =
            switch (candid) {
                case (#Text("tweet")) ?#tweet;
                case (#Text("user")) ?#user;
                case _ null;
            };

        public func toText(value : TweetWithheldScope) : Text =
            switch (value) {
                case (#tweet) "tweet";
                case (#user) "user";
            };
    };
};
