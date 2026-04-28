/// Indicates withholding details for [withheld content](https://help.twitter.com/en/rules-and-policies/tweet-withheld-by-country).

import { type UserWithheldScope; JSON = UserWithheldScope } "./UserWithheldScope";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UserWithheld.mo

module {
    public type UserWithheld = {
        /// Provides a list of countries where this content is not available.
        country_codes : [Text];
        scope : ?UserWithheldScope;
    };

    public module JSON {
        public func toCandidValue(value : UserWithheld) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("country_codes", #Array(Array.map<Text, Candid.Candid>(value.country_codes, func(s : Text) : Candid.Candid = #Text(s)))));
            switch (value.scope) {
                case (?v__) List.add(buf, ("scope", UserWithheldScope.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UserWithheld =
            switch (candid) {
                case (#Record(fields)) {
                    let ?country_codes_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "country_codes") else return null;
                    let ?country_codes = ((switch (country_codes_field.1) {
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
                    let scope : ?UserWithheldScope = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "scope")) {
                        case (?scope_field) (UserWithheldScope.fromCandidValue(scope_field.1));
                        case null null;
                    };
                    ?{
                        country_codes;
                        scope;
                    };
                };
                case _ null;
            };
    };
};
