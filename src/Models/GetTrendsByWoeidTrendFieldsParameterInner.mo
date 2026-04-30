import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// GetTrendsByWoeidTrendFieldsParameterInner.mo
/// Enum values: #trend_name, #tweet_count

module {
    public type GetTrendsByWoeidTrendFieldsParameterInner = {
        #trend_name;
        #tweet_count;
    };

    public module JSON {
        public func toCandidValue(value : GetTrendsByWoeidTrendFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#trend_name) #Text("trend_name");
                case (#tweet_count) #Text("tweet_count");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetTrendsByWoeidTrendFieldsParameterInner =
            switch (candid) {
                case (#Text("trend_name")) ?#trend_name;
                case (#Text("tweet_count")) ?#tweet_count;
                case _ null;
            };

        public func toText(value : GetTrendsByWoeidTrendFieldsParameterInner) : Text =
            switch (value) {
                case (#trend_name) "trend_name";
                case (#tweet_count) "tweet_count";
            };
    };
};
