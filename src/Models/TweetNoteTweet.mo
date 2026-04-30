/// The full-content of the Tweet, including text beyond 280 characters.

import { type TweetNoteTweetEntities; JSON = TweetNoteTweetEntities } "./TweetNoteTweetEntities";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetNoteTweet.mo

module {
    /// The required-fields slice of TweetNoteTweet — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express TweetNoteTweet as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        entities : ?TweetNoteTweetEntities;
        text_ : ?Text;
    };

    public type TweetNoteTweet = Required and Optional;

    public module JSON {
        // `init` constructs a TweetNoteTweet from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetNoteTweet.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : TweetNoteTweet {
            let ?res = from_candid(to_candid(required)) : ?TweetNoteTweet else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetNoteTweet) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.entities) {
                case (?v__) List.add(buf, ("entities", TweetNoteTweetEntities.toCandidValue(v__)));
                case null ();
            };
            switch (value.text_) {
                case (?v__) List.add(buf, ("text", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetNoteTweet =
            switch (candid) {
                case (#Record(fields)) {
                    let entities : ?TweetNoteTweetEntities = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "entities")) {
                        case (?entities_field) (TweetNoteTweetEntities.fromCandidValue(entities_field.1));
                        case null null;
                    };
                    let text_ : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "text")) {
                        case (?text__field) ((switch (text__field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        entities;
                        text_;
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
