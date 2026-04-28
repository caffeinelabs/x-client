/// Settings to indicate who can reply to the Tweet.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetCreateRequestPollReplySettings.mo
/// Enum values: #following, #mentionedusers, #subscribers, #verified

module {
    public type TweetCreateRequestPollReplySettings = {
        #following;
        #mentionedusers;
        #subscribers;
        #verified;
    };

    public module JSON {
        public func toCandidValue(value : TweetCreateRequestPollReplySettings) : Candid.Candid =
            switch (value) {
                case (#following) #Text("following");
                case (#mentionedusers) #Text("mentionedUsers");
                case (#subscribers) #Text("subscribers");
                case (#verified) #Text("verified");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetCreateRequestPollReplySettings =
            switch (candid) {
                case (#Text("following")) ?#following;
                case (#Text("mentionedUsers")) ?#mentionedusers;
                case (#Text("subscribers")) ?#subscribers;
                case (#Text("verified")) ?#verified;
                case _ null;
            };

        public func toText(value : TweetCreateRequestPollReplySettings) : Text =
            switch (value) {
                case (#following) "following";
                case (#mentionedusers) "mentionedUsers";
                case (#subscribers) "subscribers";
                case (#verified) "verified";
            };
    };
};
