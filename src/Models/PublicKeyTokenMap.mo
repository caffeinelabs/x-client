/// Juicebox configuration.

import { type PublicKeyTokenMapRealmsInner; JSON = PublicKeyTokenMapRealmsInner } "./PublicKeyTokenMapRealmsInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// PublicKeyTokenMap.mo

module {
    public type PublicKeyTokenMap = {
        /// Raw JSON for Juicebox SDK.
        key_store_token_map_json : ?Text;
        /// Maximum guess count for Juicebox.
        max_guess_count : ?Int;
        /// List of Juicebox realms.
        realms : ?[PublicKeyTokenMapRealmsInner];
    };

    public module JSON {
        public func toCandidValue(value : PublicKeyTokenMap) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.key_store_token_map_json) {
                case (?v__) List.add(buf, ("key_store_token_map_json", #Text(v__)));
                case null ();
            };
            switch (value.max_guess_count) {
                case (?v__) List.add(buf, ("max_guess_count", #Int(v__)));
                case null ();
            };
            switch (value.realms) {
                case (?v__) List.add(buf, ("realms", #Array(Array.map<PublicKeyTokenMapRealmsInner, Candid.Candid>(v__, PublicKeyTokenMapRealmsInner.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?PublicKeyTokenMap =
            switch (candid) {
                case (#Record(fields)) {
                    let key_store_token_map_json : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "key_store_token_map_json")) {
                        case (?key_store_token_map_json_field) ((switch (key_store_token_map_json_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let max_guess_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "max_guess_count")) {
                        case (?max_guess_count_field) ((switch (max_guess_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let realms : ?[PublicKeyTokenMapRealmsInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "realms")) {
                        case (?realms_field) ((switch (realms_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<PublicKeyTokenMapRealmsInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = PublicKeyTokenMapRealmsInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        key_store_token_map_json;
                        max_guess_count;
                        realms;
                    };
                };
                case _ null;
            };
    };
};
