/// A trend.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// PersonalizedTrend.mo

module {
    public type PersonalizedTrend = {
        /// Category of this trend.
        category : ?Text;
        /// Number of posts pertaining to this trend.
        post_count : ?Int;
        /// Name of the trend.
        trend_name : ?Text;
        /// Time since this is trending.
        trending_since : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : PersonalizedTrend) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.category) {
                case (?v__) List.add(buf, ("category", #Text(v__)));
                case null ();
            };
            switch (value.post_count) {
                case (?v__) List.add(buf, ("post_count", #Int(v__)));
                case null ();
            };
            switch (value.trend_name) {
                case (?v__) List.add(buf, ("trend_name", #Text(v__)));
                case null ();
            };
            switch (value.trending_since) {
                case (?v__) List.add(buf, ("trending_since", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?PersonalizedTrend =
            switch (candid) {
                case (#Record(fields)) {
                    let category : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "category")) {
                        case (?category_field) ((switch (category_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let post_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "post_count")) {
                        case (?post_count_field) ((switch (post_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let trend_name : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "trend_name")) {
                        case (?trend_name_field) ((switch (trend_name_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let trending_since : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "trending_since")) {
                        case (?trending_since_field) ((switch (trending_since_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        category;
                        post_count;
                        trend_name;
                        trending_since;
                    };
                };
                case _ null;
            };
    };
};
