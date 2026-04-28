import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// FilteredStreamingTweetResponseMatchingRulesInner.mo

module {
    public type FilteredStreamingTweetResponseMatchingRulesInner = {
        /// Unique identifier of this rule.
        id : Text;
        /// A tag meant for the labeling of user provided rules.
        tag : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : FilteredStreamingTweetResponseMatchingRulesInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("id", #Text(value.id)));
            switch (value.tag) {
                case (?v__) List.add(buf, ("tag", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?FilteredStreamingTweetResponseMatchingRulesInner =
            switch (candid) {
                case (#Record(fields)) {
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let tag : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tag")) {
                        case (?tag_field) ((switch (tag_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        id;
                        tag;
                    };
                };
                case _ null;
            };
    };
};
