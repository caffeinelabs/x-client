import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// SearchNewsNewsFieldsParameterInner.mo
/// Enum values: #category, #cluster_posts_results, #contexts, #disclaimer, #hook, #id, #keywords, #name, #summary, #updated_at

module {
    public type SearchNewsNewsFieldsParameterInner = {
        #category;
        #cluster_posts_results;
        #contexts;
        #disclaimer;
        #hook;
        #id;
        #keywords;
        #name;
        #summary;
        #updated_at;
    };

    public module JSON {
        public func toCandidValue(value : SearchNewsNewsFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#category) #Text("category");
                case (#cluster_posts_results) #Text("cluster_posts_results");
                case (#contexts) #Text("contexts");
                case (#disclaimer) #Text("disclaimer");
                case (#hook) #Text("hook");
                case (#id) #Text("id");
                case (#keywords) #Text("keywords");
                case (#name) #Text("name");
                case (#summary) #Text("summary");
                case (#updated_at) #Text("updated_at");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?SearchNewsNewsFieldsParameterInner =
            switch (candid) {
                case (#Text("category")) ?#category;
                case (#Text("cluster_posts_results")) ?#cluster_posts_results;
                case (#Text("contexts")) ?#contexts;
                case (#Text("disclaimer")) ?#disclaimer;
                case (#Text("hook")) ?#hook;
                case (#Text("id")) ?#id;
                case (#Text("keywords")) ?#keywords;
                case (#Text("name")) ?#name;
                case (#Text("summary")) ?#summary;
                case (#Text("updated_at")) ?#updated_at;
                case _ null;
            };

        public func toText(value : SearchNewsNewsFieldsParameterInner) : Text =
            switch (value) {
                case (#category) "category";
                case (#cluster_posts_results) "cluster_posts_results";
                case (#contexts) "contexts";
                case (#disclaimer) "disclaimer";
                case (#hook) "hook";
                case (#id) "id";
                case (#keywords) "keywords";
                case (#name) "name";
                case (#summary) "summary";
                case (#updated_at) "updated_at";
            };
    };
};
