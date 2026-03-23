
// GetListsPostsExpansionsParameterInner.mo
/// Enum values: #article_cover_media, #article_media_entities, #attachments_media_keys, #attachments_media_source_tweet, #attachments_poll_ids, #author_id, #edit_history_tweet_ids, #entities_mentions_username, #geo_place_id, #in_reply_to_user_id, #entities_note_mentions_username, #referenced_tweets_id, #referenced_tweets_id_attachments_media_keys, #referenced_tweets_id_author_id

module {
    // User-facing type: type-safe variants for application code
    public type GetListsPostsExpansionsParameterInner = {
        #article_cover_media;
        #article_media_entities;
        #attachments_media_keys;
        #attachments_media_source_tweet;
        #attachments_poll_ids;
        #author_id;
        #edit_history_tweet_ids;
        #entities_mentions_username;
        #geo_place_id;
        #in_reply_to_user_id;
        #entities_note_mentions_username;
        #referenced_tweets_id;
        #referenced_tweets_id_attachments_media_keys;
        #referenced_tweets_id_author_id;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetListsPostsExpansionsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetListsPostsExpansionsParameterInner) : JSON =
            switch (value) {
                case (#article_cover_media) "article.cover_media";
                case (#article_media_entities) "article.media_entities";
                case (#attachments_media_keys) "attachments.media_keys";
                case (#attachments_media_source_tweet) "attachments.media_source_tweet";
                case (#attachments_poll_ids) "attachments.poll_ids";
                case (#author_id) "author_id";
                case (#edit_history_tweet_ids) "edit_history_tweet_ids";
                case (#entities_mentions_username) "entities.mentions.username";
                case (#geo_place_id) "geo.place_id";
                case (#in_reply_to_user_id) "in_reply_to_user_id";
                case (#entities_note_mentions_username) "entities.note.mentions.username";
                case (#referenced_tweets_id) "referenced_tweets.id";
                case (#referenced_tweets_id_attachments_media_keys) "referenced_tweets.id.attachments.media_keys";
                case (#referenced_tweets_id_author_id) "referenced_tweets.id.author_id";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetListsPostsExpansionsParameterInner =
            switch (json) {
                case "article.cover_media" ?#article_cover_media;
                case "article.media_entities" ?#article_media_entities;
                case "attachments.media_keys" ?#attachments_media_keys;
                case "attachments.media_source_tweet" ?#attachments_media_source_tweet;
                case "attachments.poll_ids" ?#attachments_poll_ids;
                case "author_id" ?#author_id;
                case "edit_history_tweet_ids" ?#edit_history_tweet_ids;
                case "entities.mentions.username" ?#entities_mentions_username;
                case "geo.place_id" ?#geo_place_id;
                case "in_reply_to_user_id" ?#in_reply_to_user_id;
                case "entities.note.mentions.username" ?#entities_note_mentions_username;
                case "referenced_tweets.id" ?#referenced_tweets_id;
                case "referenced_tweets.id.attachments.media_keys" ?#referenced_tweets_id_attachments_media_keys;
                case "referenced_tweets.id.author_id" ?#referenced_tweets_id_author_id;
                case _ null;
            };
    }
}
