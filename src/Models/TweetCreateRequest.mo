
import { type TweetCreateRequestEditOptions; JSON = TweetCreateRequestEditOptions } "./TweetCreateRequestEditOptions";

import { type TweetCreateRequestGeo; JSON = TweetCreateRequestGeo } "./TweetCreateRequestGeo";

import { type TweetCreateRequestMedia; JSON = TweetCreateRequestMedia } "./TweetCreateRequestMedia";

import { type TweetCreateRequestPoll; JSON = TweetCreateRequestPoll } "./TweetCreateRequestPoll";

import { type TweetCreateRequestPollReplySettings; JSON = TweetCreateRequestPollReplySettings } "./TweetCreateRequestPollReplySettings";

import { type TweetCreateRequestReply; JSON = TweetCreateRequestReply } "./TweetCreateRequestReply";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetCreateRequest.mo

module {
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

    public module JSON {
        // `init` constructs a TweetCreateRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetCreateRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : TweetCreateRequest {
            let ?res = from_candid(to_candid(required)) : ?TweetCreateRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetCreateRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.card_uri) {
                case (?v__) List.add(buf, ("card_uri", #Text(v__)));
                case null ();
            };
            switch (value.community_id) {
                case (?v__) List.add(buf, ("community_id", #Text(v__)));
                case null ();
            };
            switch (value.direct_message_deep_link) {
                case (?v__) List.add(buf, ("direct_message_deep_link", #Text(v__)));
                case null ();
            };
            switch (value.edit_options) {
                case (?v__) List.add(buf, ("edit_options", TweetCreateRequestEditOptions.toCandidValue(v__)));
                case null ();
            };
            switch (value.for_super_followers_only) {
                case (?v__) List.add(buf, ("for_super_followers_only", #Bool(v__)));
                case null ();
            };
            switch (value.geo) {
                case (?v__) List.add(buf, ("geo", TweetCreateRequestGeo.toCandidValue(v__)));
                case null ();
            };
            switch (value.made_with_ai) {
                case (?v__) List.add(buf, ("made_with_ai", #Bool(v__)));
                case null ();
            };
            switch (value.media) {
                case (?v__) List.add(buf, ("media", TweetCreateRequestMedia.toCandidValue(v__)));
                case null ();
            };
            switch (value.nullcast) {
                case (?v__) List.add(buf, ("nullcast", #Bool(v__)));
                case null ();
            };
            switch (value.paid_partnership) {
                case (?v__) List.add(buf, ("paid_partnership", #Bool(v__)));
                case null ();
            };
            switch (value.poll) {
                case (?v__) List.add(buf, ("poll", TweetCreateRequestPoll.toCandidValue(v__)));
                case null ();
            };
            switch (value.quote_tweet_id) {
                case (?v__) List.add(buf, ("quote_tweet_id", #Text(v__)));
                case null ();
            };
            switch (value.reply) {
                case (?v__) List.add(buf, ("reply", TweetCreateRequestReply.toCandidValue(v__)));
                case null ();
            };
            switch (value.reply_settings) {
                case (?v__) List.add(buf, ("reply_settings", TweetCreateRequestPollReplySettings.toCandidValue(v__)));
                case null ();
            };
            switch (value.share_with_followers) {
                case (?v__) List.add(buf, ("share_with_followers", #Bool(v__)));
                case null ();
            };
            switch (value.text_) {
                case (?v__) List.add(buf, ("text", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetCreateRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let card_uri : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "card_uri")) {
                        case (?card_uri_field) ((switch (card_uri_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let community_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "community_id")) {
                        case (?community_id_field) ((switch (community_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let direct_message_deep_link : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "direct_message_deep_link")) {
                        case (?direct_message_deep_link_field) ((switch (direct_message_deep_link_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let edit_options : ?TweetCreateRequestEditOptions = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "edit_options")) {
                        case (?edit_options_field) (TweetCreateRequestEditOptions.fromCandidValue(edit_options_field.1));
                        case null null;
                    };
                    let for_super_followers_only : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "for_super_followers_only")) {
                        case (?for_super_followers_only_field) ((switch (for_super_followers_only_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let geo : ?TweetCreateRequestGeo = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "geo")) {
                        case (?geo_field) (TweetCreateRequestGeo.fromCandidValue(geo_field.1));
                        case null null;
                    };
                    let made_with_ai : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "made_with_ai")) {
                        case (?made_with_ai_field) ((switch (made_with_ai_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let media : ?TweetCreateRequestMedia = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media")) {
                        case (?media_field) (TweetCreateRequestMedia.fromCandidValue(media_field.1));
                        case null null;
                    };
                    let nullcast : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "nullcast")) {
                        case (?nullcast_field) ((switch (nullcast_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let paid_partnership : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "paid_partnership")) {
                        case (?paid_partnership_field) ((switch (paid_partnership_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let poll : ?TweetCreateRequestPoll = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "poll")) {
                        case (?poll_field) (TweetCreateRequestPoll.fromCandidValue(poll_field.1));
                        case null null;
                    };
                    let quote_tweet_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "quote_tweet_id")) {
                        case (?quote_tweet_id_field) ((switch (quote_tweet_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let reply : ?TweetCreateRequestReply = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "reply")) {
                        case (?reply_field) (TweetCreateRequestReply.fromCandidValue(reply_field.1));
                        case null null;
                    };
                    let reply_settings : ?TweetCreateRequestPollReplySettings = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "reply_settings")) {
                        case (?reply_settings_field) (TweetCreateRequestPollReplySettings.fromCandidValue(reply_settings_field.1));
                        case null null;
                    };
                    let share_with_followers : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "share_with_followers")) {
                        case (?share_with_followers_field) ((switch (share_with_followers_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let text_ : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "text")) {
                        case (?text__field) ((switch (text__field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        card_uri;
                        community_id;
                        direct_message_deep_link;
                        edit_options;
                        for_super_followers_only;
                        geo;
                        made_with_ai;
                        media;
                        nullcast;
                        paid_partnership;
                        poll;
                        quote_tweet_id;
                        reply;
                        reply_settings;
                        share_with_followers;
                        text_;
                    };
                };
                case _ null;
            };
    };
};
