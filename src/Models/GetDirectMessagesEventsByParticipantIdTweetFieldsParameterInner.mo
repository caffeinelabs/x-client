
// GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner.mo
/// Enum values: #article, #attachments, #author_id, #card_uri, #community_id, #context_annotations, #conversation_id, #created_at, #display_text_range, #edit_controls, #edit_history_tweet_ids, #entities, #geo, #id, #in_reply_to_user_id, #lang, #media_metadata, #non_public_metrics, #note_tweet, #organic_metrics, #possibly_sensitive, #promoted_metrics, #public_metrics, #referenced_tweets, #reply_settings, #scopes, #source, #suggested_source_links, #suggested_source_links_with_counts, #text_, #withheld

module {
    // User-facing type: type-safe variants for application code
    public type GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner = {
        #article;
        #attachments;
        #author_id;
        #card_uri;
        #community_id;
        #context_annotations;
        #conversation_id;
        #created_at;
        #display_text_range;
        #edit_controls;
        #edit_history_tweet_ids;
        #entities;
        #geo;
        #id;
        #in_reply_to_user_id;
        #lang;
        #media_metadata;
        #non_public_metrics;
        #note_tweet;
        #organic_metrics;
        #possibly_sensitive;
        #promoted_metrics;
        #public_metrics;
        #referenced_tweets;
        #reply_settings;
        #scopes;
        #source;
        #suggested_source_links;
        #suggested_source_links_with_counts;
        #text_;
        #withheld;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner) : JSON =
            switch (value) {
                case (#article) "article";
                case (#attachments) "attachments";
                case (#author_id) "author_id";
                case (#card_uri) "card_uri";
                case (#community_id) "community_id";
                case (#context_annotations) "context_annotations";
                case (#conversation_id) "conversation_id";
                case (#created_at) "created_at";
                case (#display_text_range) "display_text_range";
                case (#edit_controls) "edit_controls";
                case (#edit_history_tweet_ids) "edit_history_tweet_ids";
                case (#entities) "entities";
                case (#geo) "geo";
                case (#id) "id";
                case (#in_reply_to_user_id) "in_reply_to_user_id";
                case (#lang) "lang";
                case (#media_metadata) "media_metadata";
                case (#non_public_metrics) "non_public_metrics";
                case (#note_tweet) "note_tweet";
                case (#organic_metrics) "organic_metrics";
                case (#possibly_sensitive) "possibly_sensitive";
                case (#promoted_metrics) "promoted_metrics";
                case (#public_metrics) "public_metrics";
                case (#referenced_tweets) "referenced_tweets";
                case (#reply_settings) "reply_settings";
                case (#scopes) "scopes";
                case (#source) "source";
                case (#suggested_source_links) "suggested_source_links";
                case (#suggested_source_links_with_counts) "suggested_source_links_with_counts";
                case (#text_) "text";
                case (#withheld) "withheld";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner =
            switch (json) {
                case "article" ?#article;
                case "attachments" ?#attachments;
                case "author_id" ?#author_id;
                case "card_uri" ?#card_uri;
                case "community_id" ?#community_id;
                case "context_annotations" ?#context_annotations;
                case "conversation_id" ?#conversation_id;
                case "created_at" ?#created_at;
                case "display_text_range" ?#display_text_range;
                case "edit_controls" ?#edit_controls;
                case "edit_history_tweet_ids" ?#edit_history_tweet_ids;
                case "entities" ?#entities;
                case "geo" ?#geo;
                case "id" ?#id;
                case "in_reply_to_user_id" ?#in_reply_to_user_id;
                case "lang" ?#lang;
                case "media_metadata" ?#media_metadata;
                case "non_public_metrics" ?#non_public_metrics;
                case "note_tweet" ?#note_tweet;
                case "organic_metrics" ?#organic_metrics;
                case "possibly_sensitive" ?#possibly_sensitive;
                case "promoted_metrics" ?#promoted_metrics;
                case "public_metrics" ?#public_metrics;
                case "referenced_tweets" ?#referenced_tweets;
                case "reply_settings" ?#reply_settings;
                case "scopes" ?#scopes;
                case "source" ?#source;
                case "suggested_source_links" ?#suggested_source_links;
                case "suggested_source_links_with_counts" ?#suggested_source_links_with_counts;
                case "text" ?#text_;
                case "withheld" ?#withheld;
                case _ null;
            };
    }
}
