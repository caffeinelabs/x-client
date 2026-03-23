
// SearchNewsNewsFieldsParameterInner.mo
/// Enum values: #category, #cluster_posts_results, #contexts, #disclaimer, #hook, #id, #keywords, #name, #summary, #updated_at

module {
    // User-facing type: type-safe variants for application code
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

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer SearchNewsNewsFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : SearchNewsNewsFieldsParameterInner) : JSON =
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

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?SearchNewsNewsFieldsParameterInner =
            switch (json) {
                case "category" ?#category;
                case "cluster_posts_results" ?#cluster_posts_results;
                case "contexts" ?#contexts;
                case "disclaimer" ?#disclaimer;
                case "hook" ?#hook;
                case "id" ?#id;
                case "keywords" ?#keywords;
                case "name" ?#name;
                case "summary" ?#summary;
                case "updated_at" ?#updated_at;
                case _ null;
            };
    }
}
