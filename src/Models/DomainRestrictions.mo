import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// DomainRestrictions.mo

module {
    public type DomainRestrictions = {
        /// List of whitelisted domains
        whitelist : [Text];
    };

    public module JSON {
        public func toCandidValue(value : DomainRestrictions) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("whitelist", #Array(Array.map<Text, Candid.Candid>(value.whitelist, func(s : Text) : Candid.Candid = #Text(s)))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?DomainRestrictions =
            switch (candid) {
                case (#Record(fields)) {
                    let ?whitelist_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "whitelist") else return null;
                    let ?whitelist = ((switch (whitelist_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    ?{
                        whitelist;
                    };
                };
                case _ null;
            };
    };
};
