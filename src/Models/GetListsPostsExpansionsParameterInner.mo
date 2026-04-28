import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetListsPostsExpansionsParameterInner.mo
/// Enum values: #article_cover_media, #article_media_entities, #attachments_media_keys, #attachments_media_source_tweet, #attachments_poll_ids, #author_id, #edit_history_tweet_ids, #entities_mentions_username, #geo_place_id, #in_reply_to_user_id, #entities_note_mentions_username, #referenced_tweets_id, #referenced_tweets_id_attachments_media_keys, #referenced_tweets_id_author_id

module {
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

    public module JSON {
        public func toCandidValue(value : GetListsPostsExpansionsParameterInner) : Candid.Candid =
            switch (value) {
                case (#article_cover_media) #Text("article.cover_media");
                case (#article_media_entities) #Text("article.media_entities");
                case (#attachments_media_keys) #Text("attachments.media_keys");
                case (#attachments_media_source_tweet) #Text("attachments.media_source_tweet");
                case (#attachments_poll_ids) #Text("attachments.poll_ids");
                case (#author_id) #Text("author_id");
                case (#edit_history_tweet_ids) #Text("edit_history_tweet_ids");
                case (#entities_mentions_username) #Text("entities.mentions.username");
                case (#geo_place_id) #Text("geo.place_id");
                case (#in_reply_to_user_id) #Text("in_reply_to_user_id");
                case (#entities_note_mentions_username) #Text("entities.note.mentions.username");
                case (#referenced_tweets_id) #Text("referenced_tweets.id");
                case (#referenced_tweets_id_attachments_media_keys) #Text("referenced_tweets.id.attachments.media_keys");
                case (#referenced_tweets_id_author_id) #Text("referenced_tweets.id.author_id");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetListsPostsExpansionsParameterInner =
            switch (candid) {
                case (#Text("article.cover_media")) ?#article_cover_media;
                case (#Text("article.media_entities")) ?#article_media_entities;
                case (#Text("attachments.media_keys")) ?#attachments_media_keys;
                case (#Text("attachments.media_source_tweet")) ?#attachments_media_source_tweet;
                case (#Text("attachments.poll_ids")) ?#attachments_poll_ids;
                case (#Text("author_id")) ?#author_id;
                case (#Text("edit_history_tweet_ids")) ?#edit_history_tweet_ids;
                case (#Text("entities.mentions.username")) ?#entities_mentions_username;
                case (#Text("geo.place_id")) ?#geo_place_id;
                case (#Text("in_reply_to_user_id")) ?#in_reply_to_user_id;
                case (#Text("entities.note.mentions.username")) ?#entities_note_mentions_username;
                case (#Text("referenced_tweets.id")) ?#referenced_tweets_id;
                case (#Text("referenced_tweets.id.attachments.media_keys")) ?#referenced_tweets_id_attachments_media_keys;
                case (#Text("referenced_tweets.id.author_id")) ?#referenced_tweets_id_author_id;
                case _ null;
            };

        public func toText(value : GetListsPostsExpansionsParameterInner) : Text =
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
    };
};
