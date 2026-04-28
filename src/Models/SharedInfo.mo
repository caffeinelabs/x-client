import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// SharedInfo.mo

module {
    public type SharedInfo = {
        /// Indicates if the media is shared in direct messages
        shared_ : Bool;
    };

    public module JSON {
        public func toCandidValue(value : SharedInfo) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("shared", #Bool(value.shared_)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?SharedInfo =
            switch (candid) {
                case (#Record(fields)) {
                    let ?shared__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "shared") else return null;
                    let ?shared_ = ((switch (shared__field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    ?{
                        shared_;
                    };
                };
                case _ null;
            };
    };
};
