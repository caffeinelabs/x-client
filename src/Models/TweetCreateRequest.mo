
import { type TweetCreateRequestEditOptions; JSON = TweetCreateRequestEditOptions } "./TweetCreateRequestEditOptions";

import { type TweetCreateRequestGeo; JSON = TweetCreateRequestGeo } "./TweetCreateRequestGeo";

import { type TweetCreateRequestMedia; JSON = TweetCreateRequestMedia } "./TweetCreateRequestMedia";

import { type TweetCreateRequestPoll; JSON = TweetCreateRequestPoll } "./TweetCreateRequestPoll";

import { type TweetCreateRequestPollReplySettings; JSON = TweetCreateRequestPollReplySettings } "./TweetCreateRequestPollReplySettings";

import { type TweetCreateRequestReply; JSON = TweetCreateRequestReply } "./TweetCreateRequestReply";

// TweetCreateRequest.mo

module {
    // User-facing type: what application code uses
    public type TweetCreateRequest = {
        /// Card Uri Parameter. This is mutually exclusive from Quote Tweet Id, Poll, Media, and Direct Message Deep Link.
        card_uri : ?Text;
        /// The unique identifier of this Community.
        community_id : ?Text;
        /// Link to take the conversation from the public timeline to a private Direct Message.
        direct_message_deep_link : ?Text;
        edit_options : ?TweetCreateRequestEditOptions;
        /// Exclusive Tweet for super followers.
        for_super_followers_only : ?Bool;
        geo : ?TweetCreateRequestGeo;
        /// Whether this Post contains AI-generated media. When true, the Post will be labeled accordingly.
        made_with_ai : ?Bool;
        media : ?TweetCreateRequestMedia;
        /// Nullcasted (promoted-only) Posts do not appear in the public timeline and are not served to followers.
        nullcast : ?Bool;
        /// Whether this Post is a paid partnership. When true, the Post will be labeled as a paid promotion.
        paid_partnership : ?Bool;
        poll : ?TweetCreateRequestPoll;
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        quote_tweet_id : ?Text;
        reply : ?TweetCreateRequestReply;
        reply_settings : ?TweetCreateRequestPollReplySettings;
        /// Share community post with followers too.
        share_with_followers : ?Bool;
        /// The content of the Tweet.
        text_ : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetCreateRequest type
        public type JSON = {
            card_uri : ?Text;
            community_id : ?Text;
            direct_message_deep_link : ?Text;
            edit_options : ?TweetCreateRequestEditOptions;
            for_super_followers_only : ?Bool;
            geo : ?TweetCreateRequestGeo;
            made_with_ai : ?Bool;
            media : ?TweetCreateRequestMedia;
            nullcast : ?Bool;
            paid_partnership : ?Bool;
            poll : ?TweetCreateRequestPoll.JSON;
            quote_tweet_id : ?Text;
            reply : ?TweetCreateRequestReply;
            reply_settings : ?TweetCreateRequestPollReplySettings.JSON;
            share_with_followers : ?Bool;
            text_ : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetCreateRequest) : JSON = { value with
            poll = do ? { TweetCreateRequestPoll.toJSON(value.poll!) };
            reply_settings = do ? { TweetCreateRequestPollReplySettings.toJSON(value.reply_settings!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetCreateRequest {
            ?{ json with
                poll = do ? { TweetCreateRequestPoll.fromJSON(json.poll!)! };
                reply_settings = do ? { TweetCreateRequestPollReplySettings.fromJSON(json.reply_settings!)! };
            }
        };
    }
}
