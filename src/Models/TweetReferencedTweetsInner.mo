
import { type TweetReferencedTweetsInnerType; JSON = TweetReferencedTweetsInnerType } "./TweetReferencedTweetsInnerType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetReferencedTweetsInner.mo

module {
    public type TweetReferencedTweetsInner = {
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        id : Text;
        type_ : TweetReferencedTweetsInnerType;
    };

    public module JSON {
        public func toCandidValue(value : TweetReferencedTweetsInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("id", #Text(value.id)));
            List.add(buf, ("type", TweetReferencedTweetsInnerType.toCandidValue(value.type_)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetReferencedTweetsInner =
            switch (candid) {
                case (#Record(fields)) {
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (TweetReferencedTweetsInnerType.fromCandidValue(type__field.1)) else return null;
                    ?{
                        id;
                        type_;
                    };
                };
                case _ null;
            };
    };
};
