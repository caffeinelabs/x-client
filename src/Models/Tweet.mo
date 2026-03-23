
import { type ContextAnnotation; JSON = ContextAnnotation } "./ContextAnnotation";

import { type FullTextEntities; JSON = FullTextEntities } "./FullTextEntities";

import { type ReplySettingsWithVerifiedUsers; JSON = ReplySettingsWithVerifiedUsers } "./ReplySettingsWithVerifiedUsers";

import { type TweetAttachments; JSON = TweetAttachments } "./TweetAttachments";

import { type TweetEditControls; JSON = TweetEditControls } "./TweetEditControls";

import { type TweetGeo; JSON = TweetGeo } "./TweetGeo";

import { type TweetNonPublicMetrics; JSON = TweetNonPublicMetrics } "./TweetNonPublicMetrics";

import { type TweetNoteTweet; JSON = TweetNoteTweet } "./TweetNoteTweet";

import { type TweetOrganicMetrics; JSON = TweetOrganicMetrics } "./TweetOrganicMetrics";

import { type TweetPromotedMetrics; JSON = TweetPromotedMetrics } "./TweetPromotedMetrics";

import { type TweetPublicMetrics; JSON = TweetPublicMetrics } "./TweetPublicMetrics";

import { type TweetReferencedTweetsInner; JSON = TweetReferencedTweetsInner } "./TweetReferencedTweetsInner";

import { type TweetScopes; JSON = TweetScopes } "./TweetScopes";

import { type TweetSuggestedSourceLinksWithCounts; JSON = TweetSuggestedSourceLinksWithCounts } "./TweetSuggestedSourceLinksWithCounts";

import { type TweetWithheld; JSON = TweetWithheld } "./TweetWithheld";

import { type UrlEntity; JSON = UrlEntity } "./UrlEntity";

// Tweet.mo

module {
    // User-facing type: what application code uses
    public type Tweet = {
        attachments : ?TweetAttachments;
        /// Unique identifier of this User. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        author_id : ?Text;
        /// The unique identifier of this Community.
        community_id : ?Text;
        context_annotations : ?[ContextAnnotation];
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        conversation_id : ?Text;
        /// Creation time of the Tweet.
        created_at : ?Text;
        /// Represent a boundary range (start and end zero-based indices) for the portion of text that is displayed for a post. `start` must be smaller than `end`. The start index is inclusive, the end index is exclusive.
        display_text_range : ?[Int];
        edit_controls : ?TweetEditControls;
        /// A list of Tweet Ids in this Tweet chain.
        edit_history_tweet_ids : ?[Text];
        entities : ?FullTextEntities;
        geo : ?TweetGeo;
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        id : ?Text;
        /// Unique identifier of this User. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        in_reply_to_user_id : ?Text;
        /// Language of the Tweet, if detected by X. Returned as a BCP47 language tag.
        lang : ?Text;
        non_public_metrics : ?TweetNonPublicMetrics;
        note_tweet : ?TweetNoteTweet;
        organic_metrics : ?TweetOrganicMetrics;
        /// Indicates if this Tweet contains URLs marked as sensitive, for example content suitable for mature audiences.
        possibly_sensitive : ?Bool;
        promoted_metrics : ?TweetPromotedMetrics;
        public_metrics : ?TweetPublicMetrics;
        /// A list of Posts this Tweet refers to. For example, if the parent Tweet is a Retweet, a Quoted Tweet or a Reply, it will include the related Tweet referenced to by its parent.
        referenced_tweets : ?[TweetReferencedTweetsInner];
        reply_settings : ?ReplySettingsWithVerifiedUsers;
        scopes : ?TweetScopes;
        /// This is deprecated.
        source : ?Text;
        suggested_source_links : ?[UrlEntity];
        suggested_source_links_with_counts : ?TweetSuggestedSourceLinksWithCounts;
        /// The content of the Tweet.
        text_ : ?Text;
        /// The X handle (screen name) of this user.
        username : ?Text;
        withheld : ?TweetWithheld;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Tweet type
        public type JSON = {
            attachments : ?TweetAttachments;
            author_id : ?Text;
            community_id : ?Text;
            context_annotations : ?[ContextAnnotation];
            conversation_id : ?Text;
            created_at : ?Text;
            display_text_range : ?[Int];
            edit_controls : ?TweetEditControls;
            edit_history_tweet_ids : ?[Text];
            entities : ?FullTextEntities;
            geo : ?TweetGeo.JSON;
            id : ?Text;
            in_reply_to_user_id : ?Text;
            lang : ?Text;
            non_public_metrics : ?TweetNonPublicMetrics;
            note_tweet : ?TweetNoteTweet;
            organic_metrics : ?TweetOrganicMetrics;
            possibly_sensitive : ?Bool;
            promoted_metrics : ?TweetPromotedMetrics;
            public_metrics : ?TweetPublicMetrics;
            referenced_tweets : ?[TweetReferencedTweetsInner];
            reply_settings : ?ReplySettingsWithVerifiedUsers.JSON;
            scopes : ?TweetScopes;
            source : ?Text;
            suggested_source_links : ?[UrlEntity];
            suggested_source_links_with_counts : ?TweetSuggestedSourceLinksWithCounts;
            text_ : ?Text;
            username : ?Text;
            withheld : ?TweetWithheld.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Tweet) : JSON = { value with
            geo = do ? { TweetGeo.toJSON(value.geo!) };
            reply_settings = do ? { ReplySettingsWithVerifiedUsers.toJSON(value.reply_settings!) };
            withheld = do ? { TweetWithheld.toJSON(value.withheld!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Tweet {
            ?{ json with
                geo = do ? { TweetGeo.fromJSON(json.geo!)! };
                reply_settings = do ? { ReplySettingsWithVerifiedUsers.fromJSON(json.reply_settings!)! };
                withheld = do ? { TweetWithheld.fromJSON(json.withheld!)! };
            }
        };
    }
}
