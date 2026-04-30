
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
    /// The required-fields slice of TweetCreateRequest — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express TweetCreateRequest as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
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
        poll : ?TweetCreateRequestPoll;
        quote_tweet_id : ?Text;
        reply : ?TweetCreateRequestReply;
        reply_settings : ?TweetCreateRequestPollReplySettings;
        share_with_followers : ?Bool;
        text_ : ?Text;
    };

    public type TweetCreateRequest = Required and Optional;

    public module JSON {
        // `init` constructs a TweetCreateRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetCreateRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : TweetCreateRequest {
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

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
