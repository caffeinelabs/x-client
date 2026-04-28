import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// NewsClusterPostsResultsInner.mo

module {
    public type NewsClusterPostsResultsInner = {
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        post_id : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : NewsClusterPostsResultsInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.post_id) {
                case (?v__) List.add(buf, ("post_id", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?NewsClusterPostsResultsInner =
            switch (candid) {
                case (#Record(fields)) {
                    let post_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "post_id")) {
                        case (?post_id_field) ((switch (post_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        post_id;
                    };
                };
                case _ null;
            };
    };
};
