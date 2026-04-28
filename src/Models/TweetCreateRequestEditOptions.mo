/// Options for editing an existing Post. When provided, this request will edit the specified Post instead of creating a new one.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetCreateRequestEditOptions.mo

module {
    public type TweetCreateRequestEditOptions = {
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        previous_post_id : Text;
    };

    public module JSON {
        public func toCandidValue(value : TweetCreateRequestEditOptions) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("previous_post_id", #Text(value.previous_post_id)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetCreateRequestEditOptions =
            switch (candid) {
                case (#Record(fields)) {
                    let ?previous_post_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "previous_post_id") else return null;
                    let ?previous_post_id = ((switch (previous_post_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        previous_post_id;
                    };
                };
                case _ null;
            };
    };
};
