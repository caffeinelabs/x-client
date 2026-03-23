
// GetChatConversationsUserFieldsParameterInner.mo
/// Enum values: #affiliation, #confirmed_email, #connection_status, #created_at, #description, #entities, #id, #is_identity_verified, #location, #most_recent_tweet_id, #name, #parody, #pinned_tweet_id, #profile_banner_url, #profile_image_url, #protected, #public_metrics, #receives_your_dm, #subscription, #subscription_type, #url, #username, #verified, #verified_followers_count, #verified_type, #withheld

module {
    // User-facing type: type-safe variants for application code
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

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetChatConversationsUserFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetChatConversationsUserFieldsParameterInner) : JSON =
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

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetChatConversationsUserFieldsParameterInner =
            switch (json) {
                case "affiliation" ?#affiliation;
                case "confirmed_email" ?#confirmed_email;
                case "connection_status" ?#connection_status;
                case "created_at" ?#created_at;
                case "description" ?#description;
                case "entities" ?#entities;
                case "id" ?#id;
                case "is_identity_verified" ?#is_identity_verified;
                case "location" ?#location;
                case "most_recent_tweet_id" ?#most_recent_tweet_id;
                case "name" ?#name;
                case "parody" ?#parody;
                case "pinned_tweet_id" ?#pinned_tweet_id;
                case "profile_banner_url" ?#profile_banner_url;
                case "profile_image_url" ?#profile_image_url;
                case "protected" ?#protected;
                case "public_metrics" ?#public_metrics;
                case "receives_your_dm" ?#receives_your_dm;
                case "subscription" ?#subscription;
                case "subscription_type" ?#subscription_type;
                case "url" ?#url;
                case "username" ?#username;
                case "verified" ?#verified;
                case "verified_followers_count" ?#verified_followers_count;
                case "verified_type" ?#verified_type;
                case "withheld" ?#withheld;
                case _ null;
            };
    }
}
