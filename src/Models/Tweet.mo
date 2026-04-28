
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
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// Tweet.mo

module {
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

    public module JSON {
        public func toCandidValue(value : Tweet) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.attachments) {
                case (?v__) List.add(buf, ("attachments", TweetAttachments.toCandidValue(v__)));
                case null ();
            };
            switch (value.author_id) {
                case (?v__) List.add(buf, ("author_id", #Text(v__)));
                case null ();
            };
            switch (value.community_id) {
                case (?v__) List.add(buf, ("community_id", #Text(v__)));
                case null ();
            };
            switch (value.context_annotations) {
                case (?v__) List.add(buf, ("context_annotations", #Array(Array.map<ContextAnnotation, Candid.Candid>(v__, ContextAnnotation.toCandidValue))));
                case null ();
            };
            switch (value.conversation_id) {
                case (?v__) List.add(buf, ("conversation_id", #Text(v__)));
                case null ();
            };
            switch (value.created_at) {
                case (?v__) List.add(buf, ("created_at", #Text(v__)));
                case null ();
            };
            switch (value.display_text_range) {
                case (?v__) List.add(buf, ("display_text_range", #Array(Array.map<Int, Candid.Candid>(v__, func(i : Int) : Candid.Candid = #Int(i)))));
                case null ();
            };
            switch (value.edit_controls) {
                case (?v__) List.add(buf, ("edit_controls", TweetEditControls.toCandidValue(v__)));
                case null ();
            };
            switch (value.edit_history_tweet_ids) {
                case (?v__) List.add(buf, ("edit_history_tweet_ids", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            switch (value.entities) {
                case (?v__) List.add(buf, ("entities", FullTextEntities.toCandidValue(v__)));
                case null ();
            };
            switch (value.geo) {
                case (?v__) List.add(buf, ("geo", TweetGeo.toCandidValue(v__)));
                case null ();
            };
            switch (value.id) {
                case (?v__) List.add(buf, ("id", #Text(v__)));
                case null ();
            };
            switch (value.in_reply_to_user_id) {
                case (?v__) List.add(buf, ("in_reply_to_user_id", #Text(v__)));
                case null ();
            };
            switch (value.lang) {
                case (?v__) List.add(buf, ("lang", #Text(v__)));
                case null ();
            };
            switch (value.non_public_metrics) {
                case (?v__) List.add(buf, ("non_public_metrics", TweetNonPublicMetrics.toCandidValue(v__)));
                case null ();
            };
            switch (value.note_tweet) {
                case (?v__) List.add(buf, ("note_tweet", TweetNoteTweet.toCandidValue(v__)));
                case null ();
            };
            switch (value.organic_metrics) {
                case (?v__) List.add(buf, ("organic_metrics", TweetOrganicMetrics.toCandidValue(v__)));
                case null ();
            };
            switch (value.possibly_sensitive) {
                case (?v__) List.add(buf, ("possibly_sensitive", #Bool(v__)));
                case null ();
            };
            switch (value.promoted_metrics) {
                case (?v__) List.add(buf, ("promoted_metrics", TweetPromotedMetrics.toCandidValue(v__)));
                case null ();
            };
            switch (value.public_metrics) {
                case (?v__) List.add(buf, ("public_metrics", TweetPublicMetrics.toCandidValue(v__)));
                case null ();
            };
            switch (value.referenced_tweets) {
                case (?v__) List.add(buf, ("referenced_tweets", #Array(Array.map<TweetReferencedTweetsInner, Candid.Candid>(v__, TweetReferencedTweetsInner.toCandidValue))));
                case null ();
            };
            switch (value.reply_settings) {
                case (?v__) List.add(buf, ("reply_settings", ReplySettingsWithVerifiedUsers.toCandidValue(v__)));
                case null ();
            };
            switch (value.scopes) {
                case (?v__) List.add(buf, ("scopes", TweetScopes.toCandidValue(v__)));
                case null ();
            };
            switch (value.source) {
                case (?v__) List.add(buf, ("source", #Text(v__)));
                case null ();
            };
            switch (value.suggested_source_links) {
                case (?v__) List.add(buf, ("suggested_source_links", #Array(Array.map<UrlEntity, Candid.Candid>(v__, UrlEntity.toCandidValue))));
                case null ();
            };
            switch (value.suggested_source_links_with_counts) {
                case (?v__) List.add(buf, ("suggested_source_links_with_counts", TweetSuggestedSourceLinksWithCounts.toCandidValue(v__)));
                case null ();
            };
            switch (value.text_) {
                case (?v__) List.add(buf, ("text", #Text(v__)));
                case null ();
            };
            switch (value.username) {
                case (?v__) List.add(buf, ("username", #Text(v__)));
                case null ();
            };
            switch (value.withheld) {
                case (?v__) List.add(buf, ("withheld", TweetWithheld.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Tweet =
            switch (candid) {
                case (#Record(fields)) {
                    let attachments : ?TweetAttachments = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "attachments")) {
                        case (?attachments_field) (TweetAttachments.fromCandidValue(attachments_field.1));
                        case null null;
                    };
                    let author_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "author_id")) {
                        case (?author_id_field) ((switch (author_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let community_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "community_id")) {
                        case (?community_id_field) ((switch (community_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let context_annotations : ?[ContextAnnotation] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "context_annotations")) {
                        case (?context_annotations_field) ((switch (context_annotations_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ContextAnnotation>();
                            for (c__ in xs__.values()) {
                                let ?m__ = ContextAnnotation.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let conversation_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "conversation_id")) {
                        case (?conversation_id_field) ((switch (conversation_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let created_at : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "created_at")) {
                        case (?created_at_field) ((switch (created_at_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let display_text_range : ?[Int] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "display_text_range")) {
                        case (?display_text_range_field) ((switch (display_text_range_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Int>();
                            for (c__ in xs__.values()) {
                                let ?i__ = (switch (c__) { case (#Int(j)) ?j; case (#Nat(k)) ?k; case _ null }) else return null;
                                List.add(buf__, i__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let edit_controls : ?TweetEditControls = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "edit_controls")) {
                        case (?edit_controls_field) (TweetEditControls.fromCandidValue(edit_controls_field.1));
                        case null null;
                    };
                    let edit_history_tweet_ids : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "edit_history_tweet_ids")) {
                        case (?edit_history_tweet_ids_field) ((switch (edit_history_tweet_ids_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let entities : ?FullTextEntities = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "entities")) {
                        case (?entities_field) (FullTextEntities.fromCandidValue(entities_field.1));
                        case null null;
                    };
                    let geo : ?TweetGeo = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "geo")) {
                        case (?geo_field) (TweetGeo.fromCandidValue(geo_field.1));
                        case null null;
                    };
                    let id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id")) {
                        case (?id_field) ((switch (id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let in_reply_to_user_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "in_reply_to_user_id")) {
                        case (?in_reply_to_user_id_field) ((switch (in_reply_to_user_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let lang : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "lang")) {
                        case (?lang_field) ((switch (lang_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let non_public_metrics : ?TweetNonPublicMetrics = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "non_public_metrics")) {
                        case (?non_public_metrics_field) (TweetNonPublicMetrics.fromCandidValue(non_public_metrics_field.1));
                        case null null;
                    };
                    let note_tweet : ?TweetNoteTweet = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "note_tweet")) {
                        case (?note_tweet_field) (TweetNoteTweet.fromCandidValue(note_tweet_field.1));
                        case null null;
                    };
                    let organic_metrics : ?TweetOrganicMetrics = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "organic_metrics")) {
                        case (?organic_metrics_field) (TweetOrganicMetrics.fromCandidValue(organic_metrics_field.1));
                        case null null;
                    };
                    let possibly_sensitive : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "possibly_sensitive")) {
                        case (?possibly_sensitive_field) ((switch (possibly_sensitive_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let promoted_metrics : ?TweetPromotedMetrics = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "promoted_metrics")) {
                        case (?promoted_metrics_field) (TweetPromotedMetrics.fromCandidValue(promoted_metrics_field.1));
                        case null null;
                    };
                    let public_metrics : ?TweetPublicMetrics = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "public_metrics")) {
                        case (?public_metrics_field) (TweetPublicMetrics.fromCandidValue(public_metrics_field.1));
                        case null null;
                    };
                    let referenced_tweets : ?[TweetReferencedTweetsInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "referenced_tweets")) {
                        case (?referenced_tweets_field) ((switch (referenced_tweets_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<TweetReferencedTweetsInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = TweetReferencedTweetsInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let reply_settings : ?ReplySettingsWithVerifiedUsers = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "reply_settings")) {
                        case (?reply_settings_field) (ReplySettingsWithVerifiedUsers.fromCandidValue(reply_settings_field.1));
                        case null null;
                    };
                    let scopes : ?TweetScopes = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "scopes")) {
                        case (?scopes_field) (TweetScopes.fromCandidValue(scopes_field.1));
                        case null null;
                    };
                    let source : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "source")) {
                        case (?source_field) ((switch (source_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let suggested_source_links : ?[UrlEntity] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "suggested_source_links")) {
                        case (?suggested_source_links_field) ((switch (suggested_source_links_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<UrlEntity>();
                            for (c__ in xs__.values()) {
                                let ?m__ = UrlEntity.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let suggested_source_links_with_counts : ?TweetSuggestedSourceLinksWithCounts = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "suggested_source_links_with_counts")) {
                        case (?suggested_source_links_with_counts_field) (TweetSuggestedSourceLinksWithCounts.fromCandidValue(suggested_source_links_with_counts_field.1));
                        case null null;
                    };
                    let text_ : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "text")) {
                        case (?text__field) ((switch (text__field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let username : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "username")) {
                        case (?username_field) ((switch (username_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let withheld : ?TweetWithheld = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "withheld")) {
                        case (?withheld_field) (TweetWithheld.fromCandidValue(withheld_field.1));
                        case null null;
                    };
                    ?{
                        attachments;
                        author_id;
                        community_id;
                        context_annotations;
                        conversation_id;
                        created_at;
                        display_text_range;
                        edit_controls;
                        edit_history_tweet_ids;
                        entities;
                        geo;
                        id;
                        in_reply_to_user_id;
                        lang;
                        non_public_metrics;
                        note_tweet;
                        organic_metrics;
                        possibly_sensitive;
                        promoted_metrics;
                        public_metrics;
                        referenced_tweets;
                        reply_settings;
                        scopes;
                        source;
                        suggested_source_links;
                        suggested_source_links_with_counts;
                        text_;
                        username;
                        withheld;
                    };
                };
                case _ null;
            };
    };
};
