import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner.mo
/// Enum values: #article, #attachments, #author_id, #card_uri, #community_id, #context_annotations, #conversation_id, #created_at, #display_text_range, #edit_controls, #edit_history_tweet_ids, #entities, #geo, #id, #in_reply_to_user_id, #lang, #media_metadata, #non_public_metrics, #note_tweet, #organic_metrics, #possibly_sensitive, #promoted_metrics, #public_metrics, #referenced_tweets, #reply_settings, #scopes, #source, #suggested_source_links, #suggested_source_links_with_counts, #text_, #withheld

module {
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

    public module JSON {
        public func toCandidValue(value : GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#article) #Text("article");
                case (#attachments) #Text("attachments");
                case (#author_id) #Text("author_id");
                case (#card_uri) #Text("card_uri");
                case (#community_id) #Text("community_id");
                case (#context_annotations) #Text("context_annotations");
                case (#conversation_id) #Text("conversation_id");
                case (#created_at) #Text("created_at");
                case (#display_text_range) #Text("display_text_range");
                case (#edit_controls) #Text("edit_controls");
                case (#edit_history_tweet_ids) #Text("edit_history_tweet_ids");
                case (#entities) #Text("entities");
                case (#geo) #Text("geo");
                case (#id) #Text("id");
                case (#in_reply_to_user_id) #Text("in_reply_to_user_id");
                case (#lang) #Text("lang");
                case (#media_metadata) #Text("media_metadata");
                case (#non_public_metrics) #Text("non_public_metrics");
                case (#note_tweet) #Text("note_tweet");
                case (#organic_metrics) #Text("organic_metrics");
                case (#possibly_sensitive) #Text("possibly_sensitive");
                case (#promoted_metrics) #Text("promoted_metrics");
                case (#public_metrics) #Text("public_metrics");
                case (#referenced_tweets) #Text("referenced_tweets");
                case (#reply_settings) #Text("reply_settings");
                case (#scopes) #Text("scopes");
                case (#source) #Text("source");
                case (#suggested_source_links) #Text("suggested_source_links");
                case (#suggested_source_links_with_counts) #Text("suggested_source_links_with_counts");
                case (#text_) #Text("text");
                case (#withheld) #Text("withheld");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner =
            switch (candid) {
                case (#Text("article")) ?#article;
                case (#Text("attachments")) ?#attachments;
                case (#Text("author_id")) ?#author_id;
                case (#Text("card_uri")) ?#card_uri;
                case (#Text("community_id")) ?#community_id;
                case (#Text("context_annotations")) ?#context_annotations;
                case (#Text("conversation_id")) ?#conversation_id;
                case (#Text("created_at")) ?#created_at;
                case (#Text("display_text_range")) ?#display_text_range;
                case (#Text("edit_controls")) ?#edit_controls;
                case (#Text("edit_history_tweet_ids")) ?#edit_history_tweet_ids;
                case (#Text("entities")) ?#entities;
                case (#Text("geo")) ?#geo;
                case (#Text("id")) ?#id;
                case (#Text("in_reply_to_user_id")) ?#in_reply_to_user_id;
                case (#Text("lang")) ?#lang;
                case (#Text("media_metadata")) ?#media_metadata;
                case (#Text("non_public_metrics")) ?#non_public_metrics;
                case (#Text("note_tweet")) ?#note_tweet;
                case (#Text("organic_metrics")) ?#organic_metrics;
                case (#Text("possibly_sensitive")) ?#possibly_sensitive;
                case (#Text("promoted_metrics")) ?#promoted_metrics;
                case (#Text("public_metrics")) ?#public_metrics;
                case (#Text("referenced_tweets")) ?#referenced_tweets;
                case (#Text("reply_settings")) ?#reply_settings;
                case (#Text("scopes")) ?#scopes;
                case (#Text("source")) ?#source;
                case (#Text("suggested_source_links")) ?#suggested_source_links;
                case (#Text("suggested_source_links_with_counts")) ?#suggested_source_links_with_counts;
                case (#Text("text")) ?#text_;
                case (#Text("withheld")) ?#withheld;
                case _ null;
            };

        public func toText(value : GetDirectMessagesEventsByParticipantIdTweetFieldsParameterInner) : Text =
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
    };
};
