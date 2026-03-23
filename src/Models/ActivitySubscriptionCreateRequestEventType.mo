
// ActivitySubscriptionCreateRequestEventType.mo
/// Enum values: #profile_update_bio, #profile_update_profile_picture, #profile_update_banner_picture, #profile_update_screenname, #profile_update_geo, #profile_update_url, #profile_update_verified_badge, #profile_update_affiliate_badge, #profile_update_handle, #news_new, #follow_follow, #follow_unfollow, #spaces_start, #spaces_end, #chat_received, #chat_sent, #chat_conversation_join, #dm_sent, #dm_received, #dm_indicate_typing, #dm_read

module {
    // User-facing type: type-safe variants for application code
    public type ActivitySubscriptionCreateRequestEventType = {
        #profile_update_bio;
        #profile_update_profile_picture;
        #profile_update_banner_picture;
        #profile_update_screenname;
        #profile_update_geo;
        #profile_update_url;
        #profile_update_verified_badge;
        #profile_update_affiliate_badge;
        #profile_update_handle;
        #news_new;
        #follow_follow;
        #follow_unfollow;
        #spaces_start;
        #spaces_end;
        #chat_received;
        #chat_sent;
        #chat_conversation_join;
        #dm_sent;
        #dm_received;
        #dm_indicate_typing;
        #dm_read;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ActivitySubscriptionCreateRequestEventType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ActivitySubscriptionCreateRequestEventType) : JSON =
            switch (value) {
                case (#profile_update_bio) "profile.update.bio";
                case (#profile_update_profile_picture) "profile.update.profile_picture";
                case (#profile_update_banner_picture) "profile.update.banner_picture";
                case (#profile_update_screenname) "profile.update.screenname";
                case (#profile_update_geo) "profile.update.geo";
                case (#profile_update_url) "profile.update.url";
                case (#profile_update_verified_badge) "profile.update.verified_badge";
                case (#profile_update_affiliate_badge) "profile.update.affiliate_badge";
                case (#profile_update_handle) "profile.update.handle";
                case (#news_new) "news.new";
                case (#follow_follow) "follow.follow";
                case (#follow_unfollow) "follow.unfollow";
                case (#spaces_start) "spaces.start";
                case (#spaces_end) "spaces.end";
                case (#chat_received) "chat.received";
                case (#chat_sent) "chat.sent";
                case (#chat_conversation_join) "chat.conversation_join";
                case (#dm_sent) "dm.sent";
                case (#dm_received) "dm.received";
                case (#dm_indicate_typing) "dm.indicate_typing";
                case (#dm_read) "dm.read";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ActivitySubscriptionCreateRequestEventType =
            switch (json) {
                case "profile.update.bio" ?#profile_update_bio;
                case "profile.update.profile_picture" ?#profile_update_profile_picture;
                case "profile.update.banner_picture" ?#profile_update_banner_picture;
                case "profile.update.screenname" ?#profile_update_screenname;
                case "profile.update.geo" ?#profile_update_geo;
                case "profile.update.url" ?#profile_update_url;
                case "profile.update.verified_badge" ?#profile_update_verified_badge;
                case "profile.update.affiliate_badge" ?#profile_update_affiliate_badge;
                case "profile.update.handle" ?#profile_update_handle;
                case "news.new" ?#news_new;
                case "follow.follow" ?#follow_follow;
                case "follow.unfollow" ?#follow_unfollow;
                case "spaces.start" ?#spaces_start;
                case "spaces.end" ?#spaces_end;
                case "chat.received" ?#chat_received;
                case "chat.sent" ?#chat_sent;
                case "chat.conversation_join" ?#chat_conversation_join;
                case "dm.sent" ?#dm_sent;
                case "dm.received" ?#dm_received;
                case "dm.indicate_typing" ?#dm_indicate_typing;
                case "dm.read" ?#dm_read;
                case _ null;
            };
    }
}
