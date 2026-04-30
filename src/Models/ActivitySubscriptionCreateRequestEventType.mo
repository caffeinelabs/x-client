import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ActivitySubscriptionCreateRequestEventType.mo
/// Enum values: #profile_update_bio, #profile_update_profile_picture, #profile_update_banner_picture, #profile_update_screenname, #profile_update_geo, #profile_update_url, #profile_update_verified_badge, #profile_update_affiliate_badge, #profile_update_handle, #news_new, #follow_follow, #follow_unfollow, #spaces_start, #spaces_end, #chat_received, #chat_sent, #chat_conversation_join, #dm_sent, #dm_received, #dm_indicate_typing, #dm_read

module {
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

    public module JSON {
        public func toCandidValue(value : ActivitySubscriptionCreateRequestEventType) : Candid.Candid =
            switch (value) {
                case (#profile_update_bio) #Text("profile.update.bio");
                case (#profile_update_profile_picture) #Text("profile.update.profile_picture");
                case (#profile_update_banner_picture) #Text("profile.update.banner_picture");
                case (#profile_update_screenname) #Text("profile.update.screenname");
                case (#profile_update_geo) #Text("profile.update.geo");
                case (#profile_update_url) #Text("profile.update.url");
                case (#profile_update_verified_badge) #Text("profile.update.verified_badge");
                case (#profile_update_affiliate_badge) #Text("profile.update.affiliate_badge");
                case (#profile_update_handle) #Text("profile.update.handle");
                case (#news_new) #Text("news.new");
                case (#follow_follow) #Text("follow.follow");
                case (#follow_unfollow) #Text("follow.unfollow");
                case (#spaces_start) #Text("spaces.start");
                case (#spaces_end) #Text("spaces.end");
                case (#chat_received) #Text("chat.received");
                case (#chat_sent) #Text("chat.sent");
                case (#chat_conversation_join) #Text("chat.conversation_join");
                case (#dm_sent) #Text("dm.sent");
                case (#dm_received) #Text("dm.received");
                case (#dm_indicate_typing) #Text("dm.indicate_typing");
                case (#dm_read) #Text("dm.read");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ActivitySubscriptionCreateRequestEventType =
            switch (candid) {
                case (#Text("profile.update.bio")) ?#profile_update_bio;
                case (#Text("profile.update.profile_picture")) ?#profile_update_profile_picture;
                case (#Text("profile.update.banner_picture")) ?#profile_update_banner_picture;
                case (#Text("profile.update.screenname")) ?#profile_update_screenname;
                case (#Text("profile.update.geo")) ?#profile_update_geo;
                case (#Text("profile.update.url")) ?#profile_update_url;
                case (#Text("profile.update.verified_badge")) ?#profile_update_verified_badge;
                case (#Text("profile.update.affiliate_badge")) ?#profile_update_affiliate_badge;
                case (#Text("profile.update.handle")) ?#profile_update_handle;
                case (#Text("news.new")) ?#news_new;
                case (#Text("follow.follow")) ?#follow_follow;
                case (#Text("follow.unfollow")) ?#follow_unfollow;
                case (#Text("spaces.start")) ?#spaces_start;
                case (#Text("spaces.end")) ?#spaces_end;
                case (#Text("chat.received")) ?#chat_received;
                case (#Text("chat.sent")) ?#chat_sent;
                case (#Text("chat.conversation_join")) ?#chat_conversation_join;
                case (#Text("dm.sent")) ?#dm_sent;
                case (#Text("dm.received")) ?#dm_received;
                case (#Text("dm.indicate_typing")) ?#dm_indicate_typing;
                case (#Text("dm.read")) ?#dm_read;
                case _ null;
            };

        public func toText(value : ActivitySubscriptionCreateRequestEventType) : Text =
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
    };
};
