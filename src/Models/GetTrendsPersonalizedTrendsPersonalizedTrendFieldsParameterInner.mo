import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// GetTrendsPersonalizedTrendsPersonalizedTrendFieldsParameterInner.mo
/// Enum values: #category, #post_count, #trend_name, #trending_since

module {
    public type GetTrendsPersonalizedTrendsPersonalizedTrendFieldsParameterInner = {
        #category;
        #post_count;
        #trend_name;
        #trending_since;
    };

    public module JSON {
        public func toCandidValue(value : GetTrendsPersonalizedTrendsPersonalizedTrendFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#category) #Text("category");
                case (#post_count) #Text("post_count");
                case (#trend_name) #Text("trend_name");
                case (#trending_since) #Text("trending_since");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetTrendsPersonalizedTrendsPersonalizedTrendFieldsParameterInner =
            switch (candid) {
                case (#Text("category")) ?#category;
                case (#Text("post_count")) ?#post_count;
                case (#Text("trend_name")) ?#trend_name;
                case (#Text("trending_since")) ?#trending_since;
                case _ null;
            };

        public func toText(value : GetTrendsPersonalizedTrendsPersonalizedTrendFieldsParameterInner) : Text =
            switch (value) {
                case (#category) "category";
                case (#post_count) "post_count";
                case (#trend_name) "trend_name";
                case (#trending_since) "trending_since";
            };
    };
};
