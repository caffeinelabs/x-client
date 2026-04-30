/// Message event signature for verification.

import { type ChatMessageSigningKeyInfo; JSON = ChatMessageSigningKeyInfo } "./ChatMessageSigningKeyInfo";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatMessageEventSignature.mo

module {
    /// The required-fields slice of ChatMessageEventSignature — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatMessageEventSignature as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        message_signing_key_info_list : ?[ChatMessageSigningKeyInfo];
        public_key_version : ?Text;
        signature : ?Text;
        signature_version : ?Text;
        signing_public_key : ?Text;
    };

    public type ChatMessageEventSignature = Required and Optional;

    public module JSON {
        // `init` constructs a ChatMessageEventSignature from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatMessageEventSignature.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatMessageEventSignature {
            let ?res = from_candid(to_candid(required)) : ?ChatMessageEventSignature else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatMessageEventSignature) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.message_signing_key_info_list) {
                case (?v__) List.add(buf, ("message_signing_key_info_list", #Array(Array.map<ChatMessageSigningKeyInfo, Candid.Candid>(v__, ChatMessageSigningKeyInfo.toCandidValue))));
                case null ();
            };
            switch (value.public_key_version) {
                case (?v__) List.add(buf, ("public_key_version", #Text(v__)));
                case null ();
            };
            switch (value.signature) {
                case (?v__) List.add(buf, ("signature", #Text(v__)));
                case null ();
            };
            switch (value.signature_version) {
                case (?v__) List.add(buf, ("signature_version", #Text(v__)));
                case null ();
            };
            switch (value.signing_public_key) {
                case (?v__) List.add(buf, ("signing_public_key", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatMessageEventSignature =
            switch (candid) {
                case (#Record(fields)) {
                    let message_signing_key_info_list : ?[ChatMessageSigningKeyInfo] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "message_signing_key_info_list")) {
                        case (?message_signing_key_info_list_field) ((switch (message_signing_key_info_list_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ChatMessageSigningKeyInfo>();
                            for (c__ in xs__.values()) {
                                let ?m__ = ChatMessageSigningKeyInfo.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let public_key_version : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "public_key_version")) {
                        case (?public_key_version_field) ((switch (public_key_version_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let signature : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "signature")) {
                        case (?signature_field) ((switch (signature_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let signature_version : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "signature_version")) {
                        case (?signature_version_field) ((switch (signature_version_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let signing_public_key : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "signing_public_key")) {
                        case (?signing_public_key_field) ((switch (signing_public_key_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        message_signing_key_info_list;
                        public_key_version;
                        signature;
                        signature_version;
                        signing_public_key;
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
