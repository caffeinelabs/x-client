/// Indicates withholding details for [withheld content](https://help.twitter.com/en/rules-and-policies/tweet-withheld-by-country).

import { type TweetWithheldScope; JSON = TweetWithheldScope } "./TweetWithheldScope";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetWithheld.mo

module {
    public type TweetWithheld = {
        /// Indicates if the content is being withheld for on the basis of copyright infringement.
        copyright : Bool;
        /// Provides a list of countries where this content is not available.
        country_codes : [Text];
        scope : ?TweetWithheldScope;
    };

    public module JSON {
        // `init` constructs a TweetWithheld from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetWithheld.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            copyright : Bool;
            country_codes : [Text];
        }) : TweetWithheld {
            let ?res = from_candid(to_candid(required)) : ?TweetWithheld else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetWithheld) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("copyright", #Bool(value.copyright)));
            List.add(buf, ("country_codes", #Array(Array.map<Text, Candid.Candid>(value.country_codes, func(s : Text) : Candid.Candid = #Text(s)))));
            switch (value.scope) {
                case (?v__) List.add(buf, ("scope", TweetWithheldScope.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetWithheld =
            switch (candid) {
                case (#Record(fields)) {
                    let ?copyright_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "copyright") else return null;
                    let ?copyright = ((switch (copyright_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
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
                    let scope : ?TweetWithheldScope = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "scope")) {
                        case (?scope_field) (TweetWithheldScope.fromCandidValue(scope_field.1));
                        case null null;
                    };
                    ?{
                        copyright;
                        country_codes;
                        scope;
                    };
                };
                case _ null;
            };
    };
};
