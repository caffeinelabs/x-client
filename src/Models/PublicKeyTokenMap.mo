/// Juicebox configuration.

import { type PublicKeyTokenMapRealmsInner; JSON = PublicKeyTokenMapRealmsInner } "./PublicKeyTokenMapRealmsInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// PublicKeyTokenMap.mo

module {
    /// The required-fields slice of PublicKeyTokenMap — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express PublicKeyTokenMap as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        key_store_token_map_json : ?Text;
        max_guess_count : ?Int;
        realms : ?[PublicKeyTokenMapRealmsInner];
    };

    public type PublicKeyTokenMap = Required and Optional;

    public module JSON {
        // `init` constructs a PublicKeyTokenMap from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { PublicKeyTokenMap.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : PublicKeyTokenMap {
            let ?res = from_candid(to_candid(required)) : ?PublicKeyTokenMap else Runtime.unreachable();
            res
        };

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

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
