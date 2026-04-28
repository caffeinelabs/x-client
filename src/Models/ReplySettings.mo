/// Shows who can reply a Tweet. Fields returned are everyone, mentioned_users, and following.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ReplySettings.mo
/// Enum values: #everyone, #mentionedusers, #following, #other

module {
    public type ReplySettings = {
        #everyone;
        #mentionedusers;
        #following;
        #other;
    };

    public module JSON {
        public func toCandidValue(value : ReplySettings) : Candid.Candid =
            switch (value) {
                case (#everyone) #Text("everyone");
                case (#mentionedusers) #Text("mentionedUsers");
                case (#following) #Text("following");
                case (#other) #Text("other");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ReplySettings =
            switch (candid) {
                case (#Text("everyone")) ?#everyone;
                case (#Text("mentionedUsers")) ?#mentionedusers;
                case (#Text("following")) ?#following;
                case (#Text("other")) ?#other;
                case _ null;
            };

        public func toText(value : ReplySettings) : Text =
            switch (value) {
                case (#everyone) "everyone";
                case (#mentionedusers) "mentionedUsers";
                case (#following) "following";
                case (#other) "other";
            };
    };
};
