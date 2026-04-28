import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// AltText.mo

module {
    public type AltText = {
        /// Description of media ( <= 1000 characters )
        text_ : Text;
    };

    public module JSON {
        public func toCandidValue(value : AltText) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("text", #Text(value.text_)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?AltText =
            switch (candid) {
                case (#Record(fields)) {
                    let ?text__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "text") else return null;
                    let ?text_ = ((switch (text__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        text_;
                    };
                };
                case _ null;
            };
    };
};
