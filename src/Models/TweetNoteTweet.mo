/// The full-content of the Tweet, including text beyond 280 characters.

import { type TweetNoteTweetEntities; JSON = TweetNoteTweetEntities } "./TweetNoteTweetEntities";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetNoteTweet.mo

module {
    public type TweetNoteTweet = {
        entities : ?TweetNoteTweetEntities;
        /// The note content of the Tweet.
        text_ : ?Text;
    };

    public module JSON {
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
};
