
import { type NewsClusterPostsResultsInner; JSON = NewsClusterPostsResultsInner } "./NewsClusterPostsResultsInner";

import { type NewsContexts; JSON = NewsContexts } "./NewsContexts";

// News.mo
/// An AI generated news story.

module {
    // User-facing type: what application code uses
    public type News = {
        /// The news category.
        category : ?Text;
        cluster_posts_results : ?[NewsClusterPostsResultsInner];
        contexts : ?NewsContexts;
        disclaimer : ?Text;
        /// The news hook.
        hook : ?Text;
        keywords : ?[Text];
        last_updated_at_ms : ?Text;
        /// The headline.
        name : ?Text;
        /// Unique identifier of news story.
        rest_id : Text;
        /// The news summary.
        summary : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer News type
        public type JSON = {
            category : ?Text;
            cluster_posts_results : ?[NewsClusterPostsResultsInner];
            contexts : ?NewsContexts;
            disclaimer : ?Text;
            hook : ?Text;
            keywords : ?[Text];
            last_updated_at_ms : ?Text;
            name : ?Text;
            rest_id : Text;
            summary : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : News) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?News = ?json;
    }
}
