import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetChatConversationsUserFieldsParameterInner.mo
/// Enum values: #affiliation, #confirmed_email, #connection_status, #created_at, #description, #entities, #id, #is_identity_verified, #location, #most_recent_tweet_id, #name, #parody, #pinned_tweet_id, #profile_banner_url, #profile_image_url, #protected, #public_metrics, #receives_your_dm, #subscription, #subscription_type, #url, #username, #verified, #verified_followers_count, #verified_type, #withheld

module {
    public type GetChatConversationsUserFieldsParameterInner = {
        #affiliation;
        #confirmed_email;
        #connection_status;
        #created_at;
        #description;
        #entities;
        #id;
        #is_identity_verified;
        #location;
        #most_recent_tweet_id;
        #name;
        #parody;
        #pinned_tweet_id;
        #profile_banner_url;
        #profile_image_url;
        #protected;
        #public_metrics;
        #receives_your_dm;
        #subscription;
        #subscription_type;
        #url;
        #username;
        #verified;
        #verified_followers_count;
        #verified_type;
        #withheld;
    };

    public module JSON {
        public func toCandidValue(value : GetChatConversationsUserFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#affiliation) #Text("affiliation");
                case (#confirmed_email) #Text("confirmed_email");
                case (#connection_status) #Text("connection_status");
                case (#created_at) #Text("created_at");
                case (#description) #Text("description");
                case (#entities) #Text("entities");
                case (#id) #Text("id");
                case (#is_identity_verified) #Text("is_identity_verified");
                case (#location) #Text("location");
                case (#most_recent_tweet_id) #Text("most_recent_tweet_id");
                case (#name) #Text("name");
                case (#parody) #Text("parody");
                case (#pinned_tweet_id) #Text("pinned_tweet_id");
                case (#profile_banner_url) #Text("profile_banner_url");
                case (#profile_image_url) #Text("profile_image_url");
                case (#protected) #Text("protected");
                case (#public_metrics) #Text("public_metrics");
                case (#receives_your_dm) #Text("receives_your_dm");
                case (#subscription) #Text("subscription");
                case (#subscription_type) #Text("subscription_type");
                case (#url) #Text("url");
                case (#username) #Text("username");
                case (#verified) #Text("verified");
                case (#verified_followers_count) #Text("verified_followers_count");
                case (#verified_type) #Text("verified_type");
                case (#withheld) #Text("withheld");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetChatConversationsUserFieldsParameterInner =
            switch (candid) {
                case (#Text("affiliation")) ?#affiliation;
                case (#Text("confirmed_email")) ?#confirmed_email;
                case (#Text("connection_status")) ?#connection_status;
                case (#Text("created_at")) ?#created_at;
                case (#Text("description")) ?#description;
                case (#Text("entities")) ?#entities;
                case (#Text("id")) ?#id;
                case (#Text("is_identity_verified")) ?#is_identity_verified;
                case (#Text("location")) ?#location;
                case (#Text("most_recent_tweet_id")) ?#most_recent_tweet_id;
                case (#Text("name")) ?#name;
                case (#Text("parody")) ?#parody;
                case (#Text("pinned_tweet_id")) ?#pinned_tweet_id;
                case (#Text("profile_banner_url")) ?#profile_banner_url;
                case (#Text("profile_image_url")) ?#profile_image_url;
                case (#Text("protected")) ?#protected;
                case (#Text("public_metrics")) ?#public_metrics;
                case (#Text("receives_your_dm")) ?#receives_your_dm;
                case (#Text("subscription")) ?#subscription;
                case (#Text("subscription_type")) ?#subscription_type;
                case (#Text("url")) ?#url;
                case (#Text("username")) ?#username;
                case (#Text("verified")) ?#verified;
                case (#Text("verified_followers_count")) ?#verified_followers_count;
                case (#Text("verified_type")) ?#verified_type;
                case (#Text("withheld")) ?#withheld;
                case _ null;
            };

        public func toText(value : GetChatConversationsUserFieldsParameterInner) : Text =
            switch (value) {
                case (#affiliation) "affiliation";
                case (#confirmed_email) "confirmed_email";
                case (#connection_status) "connection_status";
                case (#created_at) "created_at";
                case (#description) "description";
                case (#entities) "entities";
                case (#id) "id";
                case (#is_identity_verified) "is_identity_verified";
                case (#location) "location";
                case (#most_recent_tweet_id) "most_recent_tweet_id";
                case (#name) "name";
                case (#parody) "parody";
                case (#pinned_tweet_id) "pinned_tweet_id";
                case (#profile_banner_url) "profile_banner_url";
                case (#profile_image_url) "profile_image_url";
                case (#protected) "protected";
                case (#public_metrics) "public_metrics";
                case (#receives_your_dm) "receives_your_dm";
                case (#subscription) "subscription";
                case (#subscription_type) "subscription_type";
                case (#url) "url";
                case (#username) "username";
                case (#verified) "verified";
                case (#verified_followers_count) "verified_followers_count";
                case (#verified_type) "verified_type";
                case (#withheld) "withheld";
            };
    };
};
