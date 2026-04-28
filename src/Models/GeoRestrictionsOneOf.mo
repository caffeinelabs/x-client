import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GeoRestrictionsOneOf.mo

module {
    public type GeoRestrictionsOneOf = {
        /// List of blacklisted country codes
        blacklisted_country_codes : [Text];
        /// List of whitelisted country codes
        whitelisted_country_codes : [Text];
    };

    public module JSON {
        public func toCandidValue(value : GeoRestrictionsOneOf) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("blacklisted_country_codes", #Array(Array.map<Text, Candid.Candid>(value.blacklisted_country_codes, func(s : Text) : Candid.Candid = #Text(s)))));
            List.add(buf, ("whitelisted_country_codes", #Array(Array.map<Text, Candid.Candid>(value.whitelisted_country_codes, func(s : Text) : Candid.Candid = #Text(s)))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?GeoRestrictionsOneOf =
            switch (candid) {
                case (#Record(fields)) {
                    let ?blacklisted_country_codes_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "blacklisted_country_codes") else return null;
                    let ?blacklisted_country_codes = ((switch (blacklisted_country_codes_field.1) {
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
                    let ?whitelisted_country_codes_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "whitelisted_country_codes") else return null;
                    let ?whitelisted_country_codes = ((switch (whitelisted_country_codes_field.1) {
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
                        blacklisted_country_codes;
                        whitelisted_country_codes;
                    };
                };
                case _ null;
            };
    };
};
