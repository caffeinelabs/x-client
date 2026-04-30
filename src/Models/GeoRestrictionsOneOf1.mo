import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// GeoRestrictionsOneOf1.mo

module {
    public type GeoRestrictionsOneOf1 = {
        /// List of blacklisted country codes
        blacklisted_country_codes : [Text];
        /// List of whitelisted country codes
        whitelisted_country_codes : [Text];
    };

    public module JSON {
        // `init` constructs a GeoRestrictionsOneOf1 from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { GeoRestrictionsOneOf1.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            blacklisted_country_codes : [Text];
            whitelisted_country_codes : [Text];
        }) : GeoRestrictionsOneOf1 {
            let ?res = from_candid(to_candid(required)) : ?GeoRestrictionsOneOf1 else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : GeoRestrictionsOneOf1) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("blacklisted_country_codes", #Array(Array.map<Text, Candid.Candid>(value.blacklisted_country_codes, func(s : Text) : Candid.Candid = #Text(s)))));
            List.add(buf, ("whitelisted_country_codes", #Array(Array.map<Text, Candid.Candid>(value.whitelisted_country_codes, func(s : Text) : Candid.Candid = #Text(s)))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?GeoRestrictionsOneOf1 =
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
