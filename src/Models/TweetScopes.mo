/// The scopes for this tweet
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetScopes.mo

module {
    public type TweetScopes = {
        /// Indicates if this Tweet is viewable by followers without the Tweet ID
        followers : ?Bool;
    };

    public module JSON {
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
