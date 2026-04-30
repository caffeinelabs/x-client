/// Suggested source links and the number of requests that included each link.

import { type UrlEntity; JSON = UrlEntity } "./UrlEntity";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetSuggestedSourceLinksWithCounts.mo

module {
    public type TweetSuggestedSourceLinksWithCounts = {
        /// Number of note requests that included the source link.
        count : ?Int;
        url : ?UrlEntity;
    };

    public module JSON {
        // `init` constructs a TweetSuggestedSourceLinksWithCounts from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetSuggestedSourceLinksWithCounts.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : TweetSuggestedSourceLinksWithCounts {
            let ?res = from_candid(to_candid(required)) : ?TweetSuggestedSourceLinksWithCounts else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetSuggestedSourceLinksWithCounts) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.count) {
                case (?v__) List.add(buf, ("count", #Int(v__)));
                case null ();
            };
            switch (value.url) {
                case (?v__) List.add(buf, ("url", UrlEntity.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetSuggestedSourceLinksWithCounts =
            switch (candid) {
                case (#Record(fields)) {
                    let count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "count")) {
                        case (?count_field) ((switch (count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let url : ?UrlEntity = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "url")) {
                        case (?url_field) (UrlEntity.fromCandidValue(url_field.1));
                        case null null;
                    };
                    ?{
                        count;
                        url;
                    };
                };
                case _ null;
            };
    };
};
