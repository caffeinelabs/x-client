/// Options for editing an existing Post. When provided, this request will edit the specified Post instead of creating a new one.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetCreateRequestEditOptions.mo

module {
    /// The required-fields slice of TweetCreateRequestEditOptions — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        previous_post_id : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express TweetCreateRequestEditOptions as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type TweetCreateRequestEditOptions = Required and Optional;

    public module JSON {
        // `init` constructs a TweetCreateRequestEditOptions from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetCreateRequestEditOptions.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : TweetCreateRequestEditOptions {
            let ?res = from_candid(to_candid(required)) : ?TweetCreateRequestEditOptions else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetCreateRequestEditOptions) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("previous_post_id", #Text(value.previous_post_id)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetCreateRequestEditOptions =
            switch (candid) {
                case (#Record(fields)) {
                    let ?previous_post_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "previous_post_id") else return null;
                    let ?previous_post_id = ((switch (previous_post_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        previous_post_id;
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
