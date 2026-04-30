import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// GetPostsCountsAllSearchCountFieldsParameterInner.mo
/// Enum values: #end, #start, #tweet_count

module {
    public type GetPostsCountsAllSearchCountFieldsParameterInner = {
        #end;
        #start;
        #tweet_count;
    };

    public module JSON {
        public func toCandidValue(value : GetPostsCountsAllSearchCountFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#end) #Text("end");
                case (#start) #Text("start");
                case (#tweet_count) #Text("tweet_count");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetPostsCountsAllSearchCountFieldsParameterInner =
            switch (candid) {
                case (#Text("end")) ?#end;
                case (#Text("start")) ?#start;
                case (#Text("tweet_count")) ?#tweet_count;
                case _ null;
            };

        public func toText(value : GetPostsCountsAllSearchCountFieldsParameterInner) : Text =
            switch (value) {
                case (#end) "end";
                case (#start) "start";
                case (#tweet_count) "tweet_count";
            };
    };
};
