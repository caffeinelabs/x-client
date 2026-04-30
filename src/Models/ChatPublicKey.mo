/// A user's public key with associated key recovery configuration.

import { type ChatJuiceboxConfig; JSON = ChatJuiceboxConfig } "./ChatJuiceboxConfig";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatPublicKey.mo

module {
    /// The required-fields slice of ChatPublicKey — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatPublicKey as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        juicebox_config : ?ChatJuiceboxConfig;
        public_key : ?Text;
        signing_public_key : ?Text;
        version : ?Text;
    };

    public type ChatPublicKey = Required and Optional;

    public module JSON {
        // `init` constructs a ChatPublicKey from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatPublicKey.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatPublicKey {
            let ?res = from_candid(to_candid(required)) : ?ChatPublicKey else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatPublicKey) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.juicebox_config) {
                case (?v__) List.add(buf, ("juicebox_config", ChatJuiceboxConfig.toCandidValue(v__)));
                case null ();
            };
            switch (value.public_key) {
                case (?v__) List.add(buf, ("public_key", #Text(v__)));
                case null ();
            };
            switch (value.signing_public_key) {
                case (?v__) List.add(buf, ("signing_public_key", #Text(v__)));
                case null ();
            };
            switch (value.version) {
                case (?v__) List.add(buf, ("version", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatPublicKey =
            switch (candid) {
                case (#Record(fields)) {
                    let juicebox_config : ?ChatJuiceboxConfig = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "juicebox_config")) {
                        case (?juicebox_config_field) (ChatJuiceboxConfig.fromCandidValue(juicebox_config_field.1));
                        case null null;
                    };
                    let public_key : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "public_key")) {
                        case (?public_key_field) ((switch (public_key_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let signing_public_key : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "signing_public_key")) {
                        case (?signing_public_key_field) ((switch (signing_public_key_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let version : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "version")) {
                        case (?version_field) ((switch (version_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        juicebox_config;
                        public_key;
                        signing_public_key;
                        version;
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
