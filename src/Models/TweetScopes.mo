/// The scopes for this tweet
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetScopes.mo

module {
    public type TweetScopes = {
        /// Indicates if this Tweet is viewable by followers without the Tweet ID
        followers : ?Bool;
    };

    public module JSON {
        // `init` constructs a TweetScopes from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetScopes.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : TweetScopes {
            let ?res = from_candid(to_candid(required)) : ?TweetScopes else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetScopes) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.followers) {
                case (?v__) List.add(buf, ("followers", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetScopes =
            switch (candid) {
                case (#Record(fields)) {
                    let followers : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "followers")) {
                        case (?followers_field) ((switch (followers_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        followers;
                    };
                };
                case _ null;
            };
    };
};
