/// An XAA subscription filter.

import { type ActivitySubscriptionFilterDirection; JSON = ActivitySubscriptionFilterDirection } "./ActivitySubscriptionFilterDirection";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ActivitySubscriptionFilter.mo

module {
    public type ActivitySubscriptionFilter = {
        direction : ?ActivitySubscriptionFilterDirection;
        /// A keyword to filter on.
        keyword : ?Text;
        /// Unique identifier of this User. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        user_id : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : ActivitySubscriptionFilter) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.direction) {
                case (?v__) List.add(buf, ("direction", ActivitySubscriptionFilterDirection.toCandidValue(v__)));
                case null ();
            };
            switch (value.keyword) {
                case (?v__) List.add(buf, ("keyword", #Text(v__)));
                case null ();
            };
            switch (value.user_id) {
                case (?v__) List.add(buf, ("user_id", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ActivitySubscriptionFilter =
            switch (candid) {
                case (#Record(fields)) {
                    let direction : ?ActivitySubscriptionFilterDirection = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "direction")) {
                        case (?direction_field) (ActivitySubscriptionFilterDirection.fromCandidValue(direction_field.1));
                        case null null;
                    };
                    let keyword : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "keyword")) {
                        case (?keyword_field) ((switch (keyword_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let user_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "user_id")) {
                        case (?user_id_field) ((switch (user_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        direction;
                        keyword;
                        user_id;
                    };
                };
                case _ null;
            };
    };
};
