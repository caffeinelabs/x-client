import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetListsFollowersExpansionsParameterInner.mo
/// Enum values: #affiliation_user_id, #most_recent_tweet_id, #pinned_tweet_id

module {
    public type GetListsFollowersExpansionsParameterInner = {
        #affiliation_user_id;
        #most_recent_tweet_id;
        #pinned_tweet_id;
    };

    public module JSON {
        public func toCandidValue(value : GetListsFollowersExpansionsParameterInner) : Candid.Candid =
            switch (value) {
                case (#affiliation_user_id) #Text("affiliation.user_id");
                case (#most_recent_tweet_id) #Text("most_recent_tweet_id");
                case (#pinned_tweet_id) #Text("pinned_tweet_id");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetListsFollowersExpansionsParameterInner =
            switch (candid) {
                case (#Text("affiliation.user_id")) ?#affiliation_user_id;
                case (#Text("most_recent_tweet_id")) ?#most_recent_tweet_id;
                case (#Text("pinned_tweet_id")) ?#pinned_tweet_id;
                case _ null;
            };

        public func toText(value : GetListsFollowersExpansionsParameterInner) : Text =
            switch (value) {
                case (#affiliation_user_id) "affiliation.user_id";
                case (#most_recent_tweet_id) "most_recent_tweet_id";
                case (#pinned_tweet_id) "pinned_tweet_id";
            };
    };
};
