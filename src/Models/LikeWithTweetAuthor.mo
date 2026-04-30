/// A Like event, with the tweet author user and the tweet being liked
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// LikeWithTweetAuthor.mo

module {
    /// The required-fields slice of LikeWithTweetAuthor — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express LikeWithTweetAuthor as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        created_at : ?Text;
        id : ?Text;
        liked_tweet_id : ?Text;
        timestamp_ms : ?Int;
        tweet_author_id : ?Text;
    };

    public type LikeWithTweetAuthor = Required and Optional;

    public module JSON {
        // `init` constructs a LikeWithTweetAuthor from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { LikeWithTweetAuthor.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : LikeWithTweetAuthor {
            let ?res = from_candid(to_candid(required)) : ?LikeWithTweetAuthor else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : LikeWithTweetAuthor) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.created_at) {
                case (?v__) List.add(buf, ("created_at", #Text(v__)));
                case null ();
            };
            switch (value.id) {
                case (?v__) List.add(buf, ("id", #Text(v__)));
                case null ();
            };
            switch (value.liked_tweet_id) {
                case (?v__) List.add(buf, ("liked_tweet_id", #Text(v__)));
                case null ();
            };
            switch (value.timestamp_ms) {
                case (?v__) List.add(buf, ("timestamp_ms", #Int(v__)));
                case null ();
            };
            switch (value.tweet_author_id) {
                case (?v__) List.add(buf, ("tweet_author_id", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?LikeWithTweetAuthor =
            switch (candid) {
                case (#Record(fields)) {
                    let created_at : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "created_at")) {
                        case (?created_at_field) ((switch (created_at_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id")) {
                        case (?id_field) ((switch (id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let liked_tweet_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "liked_tweet_id")) {
                        case (?liked_tweet_id_field) ((switch (liked_tweet_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let timestamp_ms : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "timestamp_ms")) {
                        case (?timestamp_ms_field) ((switch (timestamp_ms_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let tweet_author_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tweet_author_id")) {
                        case (?tweet_author_id_field) ((switch (tweet_author_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        created_at;
                        id;
                        liked_tweet_id;
                        timestamp_ms;
                        tweet_author_id;
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
