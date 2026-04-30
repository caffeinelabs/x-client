/// Key recovery configuration for Juicebox-based key storage.

import { type ChatJuiceboxConfigTokenMapInner; JSON = ChatJuiceboxConfigTokenMapInner } "./ChatJuiceboxConfigTokenMapInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatJuiceboxConfig.mo

module {
    /// The required-fields slice of ChatJuiceboxConfig — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatJuiceboxConfig as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        key_store_token_map_json : ?Text;
        max_guess_count : ?Int;
        realm_state_string : ?Text;
        recover_threshold : ?Int;
        register_threshold : ?Int;
        token_map : ?[ChatJuiceboxConfigTokenMapInner];
    };

    public type ChatJuiceboxConfig = Required and Optional;

    public module JSON {
        // `init` constructs a ChatJuiceboxConfig from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatJuiceboxConfig.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatJuiceboxConfig {
            let ?res = from_candid(to_candid(required)) : ?ChatJuiceboxConfig else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatJuiceboxConfig) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.key_store_token_map_json) {
                case (?v__) List.add(buf, ("key_store_token_map_json", #Text(v__)));
                case null ();
            };
            switch (value.max_guess_count) {
                case (?v__) List.add(buf, ("max_guess_count", #Int(v__)));
                case null ();
            };
            switch (value.realm_state_string) {
                case (?v__) List.add(buf, ("realm_state_string", #Text(v__)));
                case null ();
            };
            switch (value.recover_threshold) {
                case (?v__) List.add(buf, ("recover_threshold", #Int(v__)));
                case null ();
            };
            switch (value.register_threshold) {
                case (?v__) List.add(buf, ("register_threshold", #Int(v__)));
                case null ();
            };
            switch (value.token_map) {
                case (?v__) List.add(buf, ("token_map", #Array(Array.map<ChatJuiceboxConfigTokenMapInner, Candid.Candid>(v__, ChatJuiceboxConfigTokenMapInner.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatJuiceboxConfig =
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
                    let realm_state_string : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "realm_state_string")) {
                        case (?realm_state_string_field) ((switch (realm_state_string_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let recover_threshold : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "recover_threshold")) {
                        case (?recover_threshold_field) ((switch (recover_threshold_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let register_threshold : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "register_threshold")) {
                        case (?register_threshold_field) ((switch (register_threshold_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let token_map : ?[ChatJuiceboxConfigTokenMapInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "token_map")) {
                        case (?token_map_field) ((switch (token_map_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ChatJuiceboxConfigTokenMapInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = ChatJuiceboxConfigTokenMapInner.fromCandidValue(c__) else return null;
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
                        realm_state_string;
                        recover_threshold;
                        register_threshold;
                        token_map;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level. Three import shapes
    /// all reach the same function:
    ///
    ///   - `import T "...";                                     T.init {…}`     // whole-module
    ///   - `import { type T; JSON = T } "...";                  T.init {…}`     // JSON-alias
    ///   - `import { type T; JSON = T; init = myInit } "...";   myInit {…}`     // explicit rename
    ///
    /// The third form is handy when several models would all be reachable
    /// as `T.init` and you want each bound to a distinct local name.
    public let init = JSON.init;
};
