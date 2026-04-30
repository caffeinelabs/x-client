
import { type TweetComplianceSchemaTweet; JSON = TweetComplianceSchemaTweet } "./TweetComplianceSchemaTweet";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetNotice.mo

module {
    /// The required-fields slice of TweetNotice — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// If the label is being applied or removed. Possible values are ‘apply’ or ‘remove’.
        application : Text;
        /// Event time.
        event_at : Text;
        /// The type of label on the Tweet
        event_type : Text;
        tweet : TweetComplianceSchemaTweet;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express TweetNotice as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        details : ?Text;
        extended_details_url : ?Text;
        label_title : ?Text;
    };

    public type TweetNotice = Required and Optional;

    public module JSON {
        // `init` constructs a TweetNotice from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetNotice.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : TweetNotice {
            let ?res = from_candid(to_candid(required)) : ?TweetNotice else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetNotice) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("application", #Text(value.application)));
            switch (value.details) {
                case (?v__) List.add(buf, ("details", #Text(v__)));
                case null ();
            };
            List.add(buf, ("event_at", #Text(value.event_at)));
            List.add(buf, ("event_type", #Text(value.event_type)));
            switch (value.extended_details_url) {
                case (?v__) List.add(buf, ("extended_details_url", #Text(v__)));
                case null ();
            };
            switch (value.label_title) {
                case (?v__) List.add(buf, ("label_title", #Text(v__)));
                case null ();
            };
            List.add(buf, ("tweet", TweetComplianceSchemaTweet.toCandidValue(value.tweet)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetNotice =
            switch (candid) {
                case (#Record(fields)) {
                    let ?application_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "application") else return null;
                    let ?application = ((switch (application_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let details : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "details")) {
                        case (?details_field) ((switch (details_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?event_at_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "event_at") else return null;
                    let ?event_at = ((switch (event_at_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?event_type_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "event_type") else return null;
                    let ?event_type = ((switch (event_type_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let extended_details_url : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "extended_details_url")) {
                        case (?extended_details_url_field) ((switch (extended_details_url_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let label_title : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "label_title")) {
                        case (?label_title_field) ((switch (label_title_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?tweet_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tweet") else return null;
                    let ?tweet = (TweetComplianceSchemaTweet.fromCandidValue(tweet_field.1)) else return null;
                    ?{
                        application;
                        details;
                        event_at;
                        event_type;
                        extended_details_url;
                        label_title;
                        tweet;
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
