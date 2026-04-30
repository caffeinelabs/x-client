import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// Metrics.mo

module {
    /// The required-fields slice of Metrics — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express Metrics as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        app_install_attempts : ?Int;
        app_opens : ?Int;
        detail_expands : ?Int;
        email_tweet : ?Int;
        engagements : ?Int;
        follows : ?Int;
        hashtag_clicks : ?Int;
        impressions : ?Int;
        likes : ?Int;
        link_clicks : ?Int;
        media_engagements : ?Int;
        media_views : ?Int;
        permalink_clicks : ?Int;
        profile_visits : ?Int;
        quote_tweets : ?Int;
        replies : ?Int;
        retweets : ?Int;
        url_clicks : ?Int;
        user_profile_clicks : ?Int;
    };

    public type Metrics = Required and Optional;

    public module JSON {
        // `init` constructs a Metrics from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { Metrics.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : Metrics {
            let ?res = from_candid(to_candid(required)) : ?Metrics else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : Metrics) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.app_install_attempts) {
                case (?v__) List.add(buf, ("app_install_attempts", #Int(v__)));
                case null ();
            };
            switch (value.app_opens) {
                case (?v__) List.add(buf, ("app_opens", #Int(v__)));
                case null ();
            };
            switch (value.detail_expands) {
                case (?v__) List.add(buf, ("detail_expands", #Int(v__)));
                case null ();
            };
            switch (value.email_tweet) {
                case (?v__) List.add(buf, ("email_tweet", #Int(v__)));
                case null ();
            };
            switch (value.engagements) {
                case (?v__) List.add(buf, ("engagements", #Int(v__)));
                case null ();
            };
            switch (value.follows) {
                case (?v__) List.add(buf, ("follows", #Int(v__)));
                case null ();
            };
            switch (value.hashtag_clicks) {
                case (?v__) List.add(buf, ("hashtag_clicks", #Int(v__)));
                case null ();
            };
            switch (value.impressions) {
                case (?v__) List.add(buf, ("impressions", #Int(v__)));
                case null ();
            };
            switch (value.likes) {
                case (?v__) List.add(buf, ("likes", #Int(v__)));
                case null ();
            };
            switch (value.link_clicks) {
                case (?v__) List.add(buf, ("link_clicks", #Int(v__)));
                case null ();
            };
            switch (value.media_engagements) {
                case (?v__) List.add(buf, ("media_engagements", #Int(v__)));
                case null ();
            };
            switch (value.media_views) {
                case (?v__) List.add(buf, ("media_views", #Int(v__)));
                case null ();
            };
            switch (value.permalink_clicks) {
                case (?v__) List.add(buf, ("permalink_clicks", #Int(v__)));
                case null ();
            };
            switch (value.profile_visits) {
                case (?v__) List.add(buf, ("profile_visits", #Int(v__)));
                case null ();
            };
            switch (value.quote_tweets) {
                case (?v__) List.add(buf, ("quote_tweets", #Int(v__)));
                case null ();
            };
            switch (value.replies) {
                case (?v__) List.add(buf, ("replies", #Int(v__)));
                case null ();
            };
            switch (value.retweets) {
                case (?v__) List.add(buf, ("retweets", #Int(v__)));
                case null ();
            };
            switch (value.url_clicks) {
                case (?v__) List.add(buf, ("url_clicks", #Int(v__)));
                case null ();
            };
            switch (value.user_profile_clicks) {
                case (?v__) List.add(buf, ("user_profile_clicks", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Metrics =
            switch (candid) {
                case (#Record(fields)) {
                    let app_install_attempts : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "app_install_attempts")) {
                        case (?app_install_attempts_field) ((switch (app_install_attempts_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let app_opens : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "app_opens")) {
                        case (?app_opens_field) ((switch (app_opens_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let detail_expands : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "detail_expands")) {
                        case (?detail_expands_field) ((switch (detail_expands_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let email_tweet : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "email_tweet")) {
                        case (?email_tweet_field) ((switch (email_tweet_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let engagements : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "engagements")) {
                        case (?engagements_field) ((switch (engagements_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let follows : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "follows")) {
                        case (?follows_field) ((switch (follows_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let hashtag_clicks : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "hashtag_clicks")) {
                        case (?hashtag_clicks_field) ((switch (hashtag_clicks_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let impressions : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "impressions")) {
                        case (?impressions_field) ((switch (impressions_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let likes : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "likes")) {
                        case (?likes_field) ((switch (likes_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let link_clicks : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "link_clicks")) {
                        case (?link_clicks_field) ((switch (link_clicks_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let media_engagements : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_engagements")) {
                        case (?media_engagements_field) ((switch (media_engagements_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let media_views : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_views")) {
                        case (?media_views_field) ((switch (media_views_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let permalink_clicks : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "permalink_clicks")) {
                        case (?permalink_clicks_field) ((switch (permalink_clicks_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let profile_visits : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "profile_visits")) {
                        case (?profile_visits_field) ((switch (profile_visits_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let quote_tweets : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "quote_tweets")) {
                        case (?quote_tweets_field) ((switch (quote_tweets_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let replies : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "replies")) {
                        case (?replies_field) ((switch (replies_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let retweets : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "retweets")) {
                        case (?retweets_field) ((switch (retweets_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let url_clicks : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "url_clicks")) {
                        case (?url_clicks_field) ((switch (url_clicks_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let user_profile_clicks : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "user_profile_clicks")) {
                        case (?user_profile_clicks_field) ((switch (user_profile_clicks_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        app_install_attempts;
                        app_opens;
                        detail_expands;
                        email_tweet;
                        engagements;
                        follows;
                        hashtag_clicks;
                        impressions;
                        likes;
                        link_clicks;
                        media_engagements;
                        media_views;
                        permalink_clicks;
                        profile_visits;
                        quote_tweets;
                        replies;
                        retweets;
                        url_clicks;
                        user_profile_clicks;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level. Three import shapes
    /// all reach the same function:
    ///
    ///   - `import T "...";                                     T.init {…}`     // whole-module
    ///   - `import { type T; JSON = T } "...";                  T.init {…}`     // JSON-alias
    ///   - `import { type T; JSON = T; init = myInit } "...";   myInit {…}`     // explicit rename
    ///
    /// The third form is handy when several models would all be reachable
    /// as `T.init` and you want each bound to a distinct local name.
    public let init = JSON.init;
};
