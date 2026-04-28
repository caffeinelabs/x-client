import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetReferencedTweetsInnerType.mo
/// Enum values: #retweeted, #quoted, #replied_to

module {
    public type TweetReferencedTweetsInnerType = {
        #retweeted;
        #quoted;
        #replied_to;
    };

    public module JSON {
        public func toCandidValue(value : TweetReferencedTweetsInnerType) : Candid.Candid =
            switch (value) {
                case (#retweeted) #Text("retweeted");
                case (#quoted) #Text("quoted");
                case (#replied_to) #Text("replied_to");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetReferencedTweetsInnerType =
            switch (candid) {
                case (#Text("retweeted")) ?#retweeted;
                case (#Text("quoted")) ?#quoted;
                case (#Text("replied_to")) ?#replied_to;
                case _ null;
            };

        public func toText(value : TweetReferencedTweetsInnerType) : Text =
            switch (value) {
                case (#retweeted) "retweeted";
                case (#quoted) "quoted";
                case (#replied_to) "replied_to";
            };
    };
};
