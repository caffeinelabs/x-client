/// An AI generated news story.

import { type NewsClusterPostsResultsInner; JSON = NewsClusterPostsResultsInner } "./NewsClusterPostsResultsInner";

import { type NewsContexts; JSON = NewsContexts } "./NewsContexts";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// News.mo

module {
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

    public module JSON {
        public func toCandidValue(value : News) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.category) {
                case (?v__) List.add(buf, ("category", #Text(v__)));
                case null ();
            };
            switch (value.cluster_posts_results) {
                case (?v__) List.add(buf, ("cluster_posts_results", #Array(Array.map<NewsClusterPostsResultsInner, Candid.Candid>(v__, NewsClusterPostsResultsInner.toCandidValue))));
                case null ();
            };
            switch (value.contexts) {
                case (?v__) List.add(buf, ("contexts", NewsContexts.toCandidValue(v__)));
                case null ();
            };
            switch (value.disclaimer) {
                case (?v__) List.add(buf, ("disclaimer", #Text(v__)));
                case null ();
            };
            switch (value.hook) {
                case (?v__) List.add(buf, ("hook", #Text(v__)));
                case null ();
            };
            switch (value.keywords) {
                case (?v__) List.add(buf, ("keywords", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            switch (value.last_updated_at_ms) {
                case (?v__) List.add(buf, ("last_updated_at_ms", #Text(v__)));
                case null ();
            };
            switch (value.name) {
                case (?v__) List.add(buf, ("name", #Text(v__)));
                case null ();
            };
            List.add(buf, ("rest_id", #Text(value.rest_id)));
            switch (value.summary) {
                case (?v__) List.add(buf, ("summary", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?News =
            switch (candid) {
                case (#Record(fields)) {
                    let category : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "category")) {
                        case (?category_field) ((switch (category_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let cluster_posts_results : ?[NewsClusterPostsResultsInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "cluster_posts_results")) {
                        case (?cluster_posts_results_field) ((switch (cluster_posts_results_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<NewsClusterPostsResultsInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = NewsClusterPostsResultsInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let contexts : ?NewsContexts = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "contexts")) {
                        case (?contexts_field) (NewsContexts.fromCandidValue(contexts_field.1));
                        case null null;
                    };
                    let disclaimer : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "disclaimer")) {
                        case (?disclaimer_field) ((switch (disclaimer_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let hook : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "hook")) {
                        case (?hook_field) ((switch (hook_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let keywords : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "keywords")) {
                        case (?keywords_field) ((switch (keywords_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let last_updated_at_ms : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "last_updated_at_ms")) {
                        case (?last_updated_at_ms_field) ((switch (last_updated_at_ms_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let name : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "name")) {
                        case (?name_field) ((switch (name_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?rest_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "rest_id") else return null;
                    let ?rest_id = ((switch (rest_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let summary : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "summary")) {
                        case (?summary_field) ((switch (summary_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        category;
                        cluster_posts_results;
                        contexts;
                        disclaimer;
                        hook;
                        keywords;
                        last_updated_at_ms;
                        name;
                        rest_id;
                        summary;
                    };
                };
                case _ null;
            };
    };
};
