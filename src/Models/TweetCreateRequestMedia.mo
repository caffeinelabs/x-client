/// Media information being attached to created Tweet. This is mutually exclusive from Quote Tweet Id, Poll, and Card URI.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetCreateRequestMedia.mo

module {
    /// The required-fields slice of TweetCreateRequestMedia — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// A list of Media Ids to be attached to a created Tweet.
        media_ids : [Text];
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express TweetCreateRequestMedia as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        tagged_user_ids : ?[Text];
    };

    public type TweetCreateRequestMedia = Required and Optional;

    public module JSON {
        // `init` constructs a TweetCreateRequestMedia from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetCreateRequestMedia.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : TweetCreateRequestMedia {
            let ?res = from_candid(to_candid(required)) : ?TweetCreateRequestMedia else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetCreateRequestMedia) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("media_ids", #Array(Array.map<Text, Candid.Candid>(value.media_ids, func(s : Text) : Candid.Candid = #Text(s)))));
            switch (value.tagged_user_ids) {
                case (?v__) List.add(buf, ("tagged_user_ids", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetCreateRequestMedia =
            switch (candid) {
                case (#Record(fields)) {
                    let ?media_ids_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_ids") else return null;
                    let ?media_ids = ((switch (media_ids_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let tagged_user_ids : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tagged_user_ids")) {
                        case (?tagged_user_ids_field) ((switch (tagged_user_ids_field.1) {
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
                    ?{
                        media_ids;
                        tagged_user_ids;
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
