import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// SearchPostsAllSortOrderParameter.mo
/// Enum values: #recency, #relevancy

module {
    public type SearchPostsAllSortOrderParameter = {
        #recency;
        #relevancy;
    };

    public module JSON {
        public func toCandidValue(value : SearchPostsAllSortOrderParameter) : Candid.Candid =
            switch (value) {
                case (#recency) #Text("recency");
                case (#relevancy) #Text("relevancy");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?SearchPostsAllSortOrderParameter =
            switch (candid) {
                case (#Text("recency")) ?#recency;
                case (#Text("relevancy")) ?#relevancy;
                case _ null;
            };

        public func toText(value : SearchPostsAllSortOrderParameter) : Text =
            switch (value) {
                case (#recency) "recency";
                case (#relevancy) "relevancy";
            };
    };
};
