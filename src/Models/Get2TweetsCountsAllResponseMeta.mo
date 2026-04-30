import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// Get2TweetsCountsAllResponseMeta.mo

module {
    /// The required-fields slice of Get2TweetsCountsAllResponseMeta — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express Get2TweetsCountsAllResponseMeta as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        newest_id : ?Text;
        next_token : ?Text;
        oldest_id : ?Text;
        total_tweet_count : ?Int;
    };

    public type Get2TweetsCountsAllResponseMeta = Required and Optional;

    public module JSON {
        // `init` constructs a Get2TweetsCountsAllResponseMeta from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { Get2TweetsCountsAllResponseMeta.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : Get2TweetsCountsAllResponseMeta {
            let ?res = from_candid(to_candid(required)) : ?Get2TweetsCountsAllResponseMeta else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : Get2TweetsCountsAllResponseMeta) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.newest_id) {
                case (?v__) List.add(buf, ("newest_id", #Text(v__)));
                case null ();
            };
            switch (value.next_token) {
                case (?v__) List.add(buf, ("next_token", #Text(v__)));
                case null ();
            };
            switch (value.oldest_id) {
                case (?v__) List.add(buf, ("oldest_id", #Text(v__)));
                case null ();
            };
            switch (value.total_tweet_count) {
                case (?v__) List.add(buf, ("total_tweet_count", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Get2TweetsCountsAllResponseMeta =
            switch (candid) {
                case (#Record(fields)) {
                    let newest_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "newest_id")) {
                        case (?newest_id_field) ((switch (newest_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let next_token : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "next_token")) {
                        case (?next_token_field) ((switch (next_token_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let oldest_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "oldest_id")) {
                        case (?oldest_id_field) ((switch (oldest_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let total_tweet_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "total_tweet_count")) {
                        case (?total_tweet_count_field) ((switch (total_tweet_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        newest_id;
                        next_token;
                        oldest_id;
                        total_tweet_count;
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
