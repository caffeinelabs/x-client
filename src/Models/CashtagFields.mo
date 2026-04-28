/// Represent the portion of text recognized as a Cashtag, and its start and end position within the text.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CashtagFields.mo

module {
    public type CashtagFields = {
        tag : Text;
    };

    public module JSON {
        public func toCandidValue(value : CashtagFields) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("tag", #Text(value.tag)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CashtagFields =
            switch (candid) {
                case (#Record(fields)) {
                    let ?tag_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tag") else return null;
                    let ?tag = ((switch (tag_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        tag;
                    };
                };
                case _ null;
            };
    };
};
