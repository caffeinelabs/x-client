/// Shows who can reply a Tweet. Fields returned are everyone, mentioned_users, subscribers, verified and following.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ReplySettingsWithVerifiedUsers.mo
/// Enum values: #everyone, #mentionedusers, #following, #other, #subscribers, #verified

module {
    public type ReplySettingsWithVerifiedUsers = {
        #everyone;
        #mentionedusers;
        #following;
        #other;
        #subscribers;
        #verified;
    };

    public module JSON {
        public func toCandidValue(value : ReplySettingsWithVerifiedUsers) : Candid.Candid =
            switch (value) {
                case (#everyone) #Text("everyone");
                case (#mentionedusers) #Text("mentionedUsers");
                case (#following) #Text("following");
                case (#other) #Text("other");
                case (#subscribers) #Text("subscribers");
                case (#verified) #Text("verified");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ReplySettingsWithVerifiedUsers =
            switch (candid) {
                case (#Text("everyone")) ?#everyone;
                case (#Text("mentionedUsers")) ?#mentionedusers;
                case (#Text("following")) ?#following;
                case (#Text("other")) ?#other;
                case (#Text("subscribers")) ?#subscribers;
                case (#Text("verified")) ?#verified;
                case _ null;
            };

        public func toText(value : ReplySettingsWithVerifiedUsers) : Text =
            switch (value) {
                case (#everyone) "everyone";
                case (#mentionedusers) "mentionedUsers";
                case (#following) "following";
                case (#other) "other";
                case (#subscribers) "subscribers";
                case (#verified) "verified";
            };
    };
};
